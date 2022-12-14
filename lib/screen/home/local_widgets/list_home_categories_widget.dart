import 'package:flutter/material.dart';
import 'package:tajir/screen/home/local_widgets/home_categories_widget.dart';
import 'package:tajir/theme/app_dimension.dart';

class ListHomeCategoriesWidget extends StatelessWidget {
  const ListHomeCategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimension.homeCategoriesHeight + AppDimension.marginExtraLarge,
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
