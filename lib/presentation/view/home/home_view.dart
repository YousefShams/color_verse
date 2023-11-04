import 'package:color_verse/app/di/di.dart';
import 'package:color_verse/app/resources/app_values.dart';
import 'package:color_verse/presentation/view/home/components/color_palettes_list.dart';
import 'package:color_verse/presentation/view/home/components/home_title.dart';
import 'package:color_verse/presentation/view_model/home/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/home/state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const p = AppValues.pagePadding;
    return BlocProvider(
      create: (cubitContext) => getIt<HomeCubit>()..init(),
      child: BlocBuilder<HomeCubit,HomeState>(
        builder: (context, state) {
          final cubit = HomeCubit.get(context);
          return Visibility(
            visible: state is! HomeLoadingState,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(p,p,p,0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HomeTitle(),
                  const SizedBox(height: AppValues.verticalSpaceBetweenWidgets),
                  ColorPalettesList(colorPalettes: cubit.palettes,
                    onPaletteSave: cubit.togglePaletteFavButton,
                    isPaletteSaved: cubit.isPaletteSaved,)
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
