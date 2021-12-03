import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';

class ListProductPriceBlock extends StatelessWidget {
  final String price;
  final String? salePrice;

  const ListProductPriceBlock({Key? key, required this.price, this.salePrice})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimension.paddingSmall,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$price TMT',
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: AppColors.darkBlueColor, fontWeight: FontWeight.bold),
          ),
          Visibility(
            visible: salePrice != null && salePrice?.isNotEmpty == true,
            child: Text('$salePrice TMT',
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(decoration: TextDecoration.lineThrough)),
          )
        ],
      ),
    );
  }
}
