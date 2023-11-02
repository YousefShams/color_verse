import 'package:color_verse/presentation/view/generate/components/color_palette.dart';
import 'package:color_verse/presentation/view/generate/components/generate_bottom_buttons.dart';
import 'package:color_verse/presentation/view/generate/components/pick_color_button.dart';
import 'package:color_verse/presentation/view_model/generate/cubit.dart';
import 'package:color_verse/presentation/view_model/generate/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app/resources/app_values.dart';

class GenerateScreen extends StatelessWidget {
  const GenerateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const p = AppValues.pagePadding;
    return BlocProvider(
      create: (cubitContext) => GenerateCubit(),
      child: BlocBuilder<GenerateCubit, GenerateState>(
        builder: (cubitContext, state) {
          final cubit = GenerateCubit.get(cubitContext);
          return Padding(
            padding: const EdgeInsets.fromLTRB(p,p,p,0),
            child: Column(
              children: [
                PickColorButton(pickedColor: cubit.pickedColor,
                  onChanged: cubit.onColorChanged,),
                const SizedBox(height: AppValues.pagePadding),
                (!cubit.isPaletteGenerated) ? const SizedBox.shrink() :
                ColorPalette(palette: cubit.generatedPalette!.palette),
                (!cubit.isPaletteGenerated) ? const Spacer() :
                const SizedBox(height: AppValues.verticalSpaceBetweenWidgets),
                GenerateBottomButtons(onGenerate: cubit.generatePalettes,
                    onSave: cubit.savePalette, isPaletteGenerated: cubit.isPaletteGenerated)
              ],
            ),
          );
        },
      ),
    );
  }
}
