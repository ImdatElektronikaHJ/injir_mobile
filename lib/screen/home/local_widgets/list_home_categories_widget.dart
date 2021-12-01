import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimensions.dart';

class ListHomeCategoriesWidget extends StatelessWidget {
  const ListHomeCategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          AppDimensions.homeCategoriesHeight + AppDimensions.marginExtraLarge,
      child: ListView.builder(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return const HomeCategoriesWidget();
        },
      ),
    );
  }
}

class HomeCategoriesWidget extends StatelessWidget {
  const HomeCategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: AppDimensions.homeCategoriesWidth,
            margin: const EdgeInsets.symmetric(
              horizontal: AppDimensions.marginSmall,
              vertical: AppDimensions.marginSmall / 2,
            ),
            decoration: BoxDecoration(
                color: AppColors.lightGreyColor,
                boxShadow: [
                  BoxShadow(
                      color: AppColors.lightGreyColor.withOpacity(0.2),
                      offset: const Offset(0, 2),
                      blurRadius: 20)
                ],
                borderRadius:
                    BorderRadius.circular(AppDimensions.borderRadiusMedium)),
          ),
        ),
        Text('Jeans',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontSize: 16.0)),
      ],
    );
  }
}
