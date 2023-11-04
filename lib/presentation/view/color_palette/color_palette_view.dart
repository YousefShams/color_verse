import 'package:color_verse/app/di/di.dart';
import 'package:color_verse/domain/entities/color_palette_model.dart';
import 'package:color_verse/presentation/view/color_palette/components/color_palette_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/color_palette/cubit.dart';
import '../../view_model/color_palette/state.dart';

class ColorPaletteScreen extends StatelessWidget {
  const ColorPaletteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final palette = ModalRoute.of(context)!.settings.arguments as ColorPaletteModel;
    return BlocProvider(
      create: (cubitContext) => getIt<ColorPaletteCubit>()..init(palette),
      child: BlocBuilder<ColorPaletteCubit,ColorPaletteState>(
          builder: (context, state) {
            final cubit = ColorPaletteCubit.get(context);
            return Scaffold(
              body: Column(
                children: List.generate(
                  cubit.palette.length,
                  (index) => ColorPaletteItem(
                    colorModel: palette.paletteColors[index],
                    index: index, onColorFavToggle: cubit.toggleColorFavButton,
                    isSaved: cubit.isColorSaved(index),
                  )
                ),
              ),
            );
          }
      ),
    );
  }
}
