import 'package:flutter/material.dart';
import 'package:tajir/theme/app_dimension.dart';

class ShowcaseBannerItemWidget extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String description;
  const ShowcaseBannerItemWidget(
      {Key? key,
      required this.imageAsset,
      required this.title,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppDimension.paddingLarge),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.asset(
              imageAsset,
              fit: BoxFit.contain,
              alignment: Alignment.center,
            ),
          ),
          const SizedBox(
            height: AppDimension.paddingExtraLarge,
          ),
          Text(
            title.toUpperCase(),
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: AppDimension.paddingExtraLarge,
          ),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyText2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
