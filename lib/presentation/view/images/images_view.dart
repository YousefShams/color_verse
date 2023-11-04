import 'package:color_verse/app/components/default_button.dart';
import 'package:color_verse/app/components/loading_screen.dart';
import 'package:color_verse/app/components/page_title.dart';
import 'package:color_verse/app/di/di.dart';
import 'package:color_verse/app/resources/app_strings.dart';
import 'package:color_verse/app/resources/app_values.dart';
import 'package:color_verse/presentation/view/images/components/image_palette.dart';
import 'package:color_verse/presentation/view/images/components/image_picked.dart';
import 'package:color_verse/presentation/view/images/components/image_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/image/cubit.dart';
import '../../view_model/image/state.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const p = AppValues.pagePadding;
    return BlocProvider(
      create: (cubitContext) => getIt<ImageCubit>(),
      child: BlocBuilder<ImageCubit, ImageState>(
        builder: (cubitContext, state) {
          final cubit = ImageCubit.get(cubitContext);
          return Visibility(
            visible: state is! ImageLoadingState,
            replacement: const LoadingScreen(),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(p,p,p,0),
              child: Visibility(
                visible: cubit.isPaletteGenerated,
                replacement: ImagePlaceholder(
                    onPickImage: cubit.onGeneratePaletteFromImage),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PageTitle(title: AppStrings.result),
                    const Spacer(),
                    ImagePicked(image: cubit.image),
                    ImagePalette(palette: cubit.palette),
                    const Spacer(flex: 2),
                    Row(
                      children: [
                        Expanded(
                          child: DefaultOutlinedButton(
                              onPressed: cubit.onGeneratePaletteFromImage,
                              text: AppStrings.pickImage, expanded: true
                          ),
                        ),
                        const SizedBox(width: AppValues.smallPadding),
                        Expanded(
                          child: DefaultButton(onPressed: cubit.savePalette,
                              text: AppStrings.savePalette, expanded: true)
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
