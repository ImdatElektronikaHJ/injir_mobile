import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';

class OrderListProduct extends StatelessWidget {
  const OrderListProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85.0,
      padding: const EdgeInsets.all(AppDimension.paddingMedium),
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(color: AppColors.blackColor6, blurRadius: 2),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 45.0,
            width: 45.0,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.darkerGreyColor),
              borderRadius:
                  BorderRadius.circular(AppDimension.borderRadiusMicro),
              image: const DecorationImage(
                image: AssetImage('assets/images/placeholder/1.png'),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimension.paddingMedium,
                ),
                child: Text('Samsung Phone Falaz S3'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppDimension.paddingMedium,
                    vertical: AppDimension.paddingSmall / 2),
                child: Text(
                  '12345 TMT',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: AppColors.blueColor,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
