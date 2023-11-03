import 'package:color_verse/app/functions/functions.dart';
import 'package:color_verse/presentation/view_model/image/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:palette_generator/palette_generator.dart';
import '../../../app/resources/app_shared_prefs_keys.dart';
import '../../../data/apis/local/local_api.dart';


class ImageCubit extends Cubit<ImageState> {
  final LocalApi localApi;
  ImageCubit(this.localApi) : super(ImageInitialState());

  static ImageCubit get(context) => BlocProvider.of(context);

  //Variables
  List<String>? palette;
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
        imageQuality: 25);
  }


  Future<List<String>> generatePalette(XFile file) async {
    final bytes = await file.readAsBytes();

    final imageResult = Image.memory(bytes).image;

    image = imageResult;

    final paletteGen = await PaletteGenerator.fromImageProvider(
        imageResult, maximumColorCount: 6);

    final palette = paletteGen.paletteColors.map((e) =>
        AppFunctions.getHexCodeFromColor(e.color)).toList();

    return palette;
  }

  Future savePalette() async {
    if(isPaletteGenerated) {
      await localApi.save(AppDbKeys.palettesDb, {palette.toString() : palette});
    }
  }
}