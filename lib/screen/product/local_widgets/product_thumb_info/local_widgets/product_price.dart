
import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/widget/sale_widget.dart';

class ProductPrice extends StatelessWidget {
  final double price;
  final double? salePrice;
  const ProductPrice({Key? key, required this.price, this.salePrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${price.toStringAsFixed(2)} TMT',
          maxLines: 1,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
              color: AppColors.darkBlueColor,
              fontSize: 24.0,
              fontWeight: FontWeight.bold),
        ),
        Visibility(
          visible: salePrice != 0 && salePrice != null,
          child: Row(
            children: [
              Text(
                '${salePrice?.toStringAsFixed(2)} TMT',
                style: Theme.of(context).textTheme.caption!.copyWith(
                      fontSize: 18.0,
                      decoration: TextDecoration.lineThrough,
                    ),
              ),
              SaleWidget(
                salePercentage:
                    (100 - (price / salePrice! * 100)).toStringAsFixed(2),
              )
            ],
          ),
        ),
      ],
    );
  }
}
