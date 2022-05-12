import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tajir/theme/app_dimension.dart';

class CachingImage extends StatelessWidget {
  final String? imageUrl;
  final BoxFit? fit;
  const CachingImage(this.imageUrl, {Key? key, this.fit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return imageUrl == null
        ? Image.asset(
            'assets/images/tajir_logo_text_blue.png',
          )
        : CachedNetworkImage(
            fit: fit ?? BoxFit.contain,
            imageUrl: imageUrl!,
            width: double.infinity,
            errorWidget: (context, _, __) => Image.asset(
              'assets/images/tajir_logo_text_blue.png',
            ),
            progressIndicatorBuilder: (context, _, progress) => Padding(
              padding: const EdgeInsets.all(AppDimension.paddingMedium),
              child: Center(
                child: Image.asset(
                  'assets/images/tajir_logo_text_blue.png',
                ),
              ),
            ),
          );
  }
}
