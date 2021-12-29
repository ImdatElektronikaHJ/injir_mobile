import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tajir/theme/app_colors.dart';
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
            child: SvgPicture.asset(imageAsset, fit: BoxFit.contain),
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
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: AppColors.darkerGreyColor),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
