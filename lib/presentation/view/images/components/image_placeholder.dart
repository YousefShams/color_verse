import 'package:color_verse/app/components/default_button.dart';
import 'package:color_verse/app/extensions/extensions.dart';
import 'package:color_verse/app/resources/app_assets.dart';
import 'package:color_verse/app/resources/app_strings.dart';
import 'package:color_verse/app/resources/app_values.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ImagePlaceholder extends StatelessWidget {
  final Function onPickImage;
  const ImagePlaceholder({Key? key, required this.onPickImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Spacer(),
        GestureDetector(
          onTap: () { onPickImage(); },
          child: Transform.translate(
              offset: const Offset(20, 0),
              child: Lottie.asset(AppAssets.image)),
        ),
        const SizedBox(width: AppValues.pagePadding),
        Text(AppStrings.pickImageText, style: context.textTheme.bodyLarge,
          textAlign: TextAlign.center),
        const Spacer(),
        DefaultButton(onPressed: onPickImage, text: AppStrings.pickImage)
      ],
    );
  }
}
