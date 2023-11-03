import 'package:color_verse/presentation/view/color_palette/components/color_palette_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/apis/local/local_api.dart';
import '../../view_model/color_palette/cubit.dart';
import '../../view_model/color_palette/state.dart';

class ColorPaletteScreen extends StatelessWidget {
  const ColorPaletteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hexCodes = ModalRoute.of(context)!.settings.arguments as List<String>;
    return BlocProvider(
      create: (cubitContext) => ColorPaletteCubit(const LocalApi())..init(hexCodes),
      child: BlocBuilder<ColorPaletteCubit,ColorPaletteState>(
          builder: (context, state) {
            final cubit = ColorPaletteCubit.get(context);
            return Scaffold(
              body: Column(
                children: List.generate(
                  hexCodes.length,
                  (index) => ColorPaletteItem(
                    hexCode: hexCodes[index],
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
