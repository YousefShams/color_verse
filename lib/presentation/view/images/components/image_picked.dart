import 'package:color_verse/app/resources/app_values.dart';
import 'package:flutter/material.dart';

class ImagePicked extends StatelessWidget {
  final ImageProvider? image;
  const ImagePicked({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(AppValues.defaultBorderRadius),
        topRight: Radius.circular(AppValues.defaultBorderRadius),
      ),
        child: (image!=null) ?
          AspectRatio(
            aspectRatio: 13/9,
            child: Image(image: image!, width: double.maxFinite, fit: BoxFit.cover)) :
          const SizedBox.shrink()
    );
  }
}
