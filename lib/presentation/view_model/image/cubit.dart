import 'package:color_verse/domain/entities/color_model.dart';
import 'package:color_verse/domain/entities/color_palette_model.dart';
import 'package:color_verse/presentation/view_model/image/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:palette_generator/palette_generator.dart';
import '../../../app/components/default_snakebar.dart';
import '../../../app/resources/app_strings.dart';
import '../../../domain/usecases/save_palette_usecase.dart';


class ImageCubit extends Cubit<ImageState> {
  final SavePaletteUsecase _savePaletteUC;
  ImageCubit(this._savePaletteUC) : super(ImageInitialState());

  static ImageCubit get(context) => BlocProvider.of(context);

  //Variables
  ColorPaletteModel? palette;
  ImageProvider? image;
  bool get isPaletteGenerated => palette != null;


  //Events
  Future onGeneratePaletteFromImage() async {
    final file = await pickImage();
    if(file!=null) {
      emit(ImageLoadingState());
      palette = await generatePalette(file);
    }
    emit(ImageUpdateState());
  }

  Future<XFile?> pickImage() async {
    return await ImagePicker().pickImage(source: ImageSource.gallery,
        imageQuality: 50);
  }


  Future<ColorPaletteModel> generatePalette(XFile file) async {
    final bytes = await file.readAsBytes();

    final imageResult = Image.memory(bytes).image;

    image = imageResult;

    final paletteGen = await PaletteGenerator.fromImageProvider(
        imageResult, maximumColorCount: 6);

    final palette = paletteGen.paletteColors.map((e) => ColorModel(e.color)).toList();

    return ColorPaletteModel(palette);
  }

  Future savePalette() async {
    if(isPaletteGenerated) {
      await _savePaletteUC.execute(palette!);
      showDefaultSnackBar(AppStrings.saved);
    }
  }
}