import 'package:flutter/material.dart';
import 'package:tajir/theme/app_dimensions.dart';

class ListHomeBrandsWidget extends StatelessWidget {
  const ListHomeBrandsWidget({Key? key}) : super(key: key);

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
          return const HomeBrandsWidget();
        },
      ),
    );
  }
}

class HomeBrandsWidget extends StatelessWidget {
  const HomeBrandsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.homeBrandsHeight + AppDimensions.marginSmall,
      padding: const EdgeInsets.all(AppDimensions.marginSmall),
      child: Image.asset('assets/placeholder/bn1.png'),
    );
  }
}
