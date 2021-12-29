import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/widget/sale_widget.dart';

class SearchListProduct extends StatelessWidget {
  const SearchListProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppDimension.paddingMedium),
      margin: const EdgeInsets.symmetric(vertical: AppDimension.marginSmall),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        boxShadow: const [
          BoxShadow(
            color: AppColors.blackColor6,
            blurRadius: 19,
            offset: Offset(0, 2),
          ),
        ],
      ),
      height: AppDimension.searchProductHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppDimension.paddingMedium),
            child: Image.asset('assets/images/placeholder/samsung.png'),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Samsung Galaxy Note 10 8/256GB Aura Black',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 16.0),
                  maxLines: 3,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '1259 TMT',
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: AppColors.darkBlueColor,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: AppDimension.paddingMedium,
                    ),
                    Text(
                      '1500 TMT',
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(decoration: TextDecoration.lineThrough),
                    ),
                    const SaleWidget(salePercentage: '32')
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}