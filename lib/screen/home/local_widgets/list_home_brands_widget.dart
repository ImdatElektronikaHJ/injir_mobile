import 'package:flutter/material.dart';
import 'package:tajir/theme/app_dimension.dart';

import 'home_brands_widget.dart';

class ListHomeBrandsWidget extends StatelessWidget {
  const ListHomeBrandsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          AppDimension.homeCategoriesHeight + AppDimension.marginExtraLarge,
      child: ListView.builder(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return const HomeBrandsWidget();
        },
      ),
    );
  }
}
