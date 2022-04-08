import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';

class CategoryScreenItem extends StatelessWidget {
  final Function? onCategoryTapped;

  const CategoryScreenItem({Key? key, this.onCategoryTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(AppDimension.paddingSmall),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: AppColors.blackColor6,
                blurRadius: 19,
                offset: Offset(0, 2),
              ),
            ],
            borderRadius:
                BorderRadius.circular(AppDimension.borderRadiusSmall)),
        child: Column(children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/placeholder/phone.png'),
                    fit: BoxFit.contain),
              ),
            ),
          ),
          Text(
            'Смартфоны, планшеты и аксессуары',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ]),
      ),
      onTap: () => onCategoryTapped!(),
    );
  }
}