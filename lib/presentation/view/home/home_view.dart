import 'package:color_verse/app/components/app_title.dart';
import 'package:color_verse/app/resources/app_colors.dart';
import 'package:color_verse/app/constants/app_palettes.dart';
import 'package:color_verse/app/resources/app_strings.dart';
import 'package:color_verse/app/resources/app_values.dart';
import 'package:color_verse/data/apis/local/local_api.dart';
import 'package:color_verse/presentation/view/home/components/color_palettes_list.dart';
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
      create: (cubitContext) => HomeCubit(const LocalApi())..init(),
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
                  const AppTitle(big: true, color:AppColors.primaryColor,title: AppStrings.homeTitle),
                  const SizedBox(height: AppValues.verticalSpaceBetweenWidgets),
                  ColorPalettesList(colorPalettes: appPalettes,
                    onPaletteSave: cubit.togglePaletteFavButton, isPaletteSaved: cubit.isPaletteSaved,)
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
