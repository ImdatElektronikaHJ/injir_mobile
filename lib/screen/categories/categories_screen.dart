import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/const/app_routes.dart';
import 'package:tajir/const/nested_navigation_ids.dart';
import 'package:tajir/theme/app_dimension.dart';


class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Map<String, dynamic>> category = [
    {'title': 'Элетроника', 'img': 'assets/images/placeholder/1t.png'},
    {'title': 'Бытовая техника', 'img': 'assets/images/placeholder/2t.png'},
    {'title': 'Товары для дома', 'img': 'assets/images/placeholder/2.png'},
    {'title': 'Одежда, обувь и аксеsfgdfs', 'img': 'assets/images/placeholder/3.png'},
    {'title': 'Элетроника', 'img': 'assets/images/placeholder/1t.png'},
    {'title': 'Бытовая техника', 'img': 'assets/images/placeholder/2t.png'},
    {'title': 'Товары для дома', 'img': 'assets/images/placeholder/2.png'},
    {'title': 'Одежда, обувь и аксеsfgdfs', 'img': 'assets/images/placeholder/3.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      primary: true,
      itemCount: category.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 1.2,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: AppDimension.paddingMedium, horizontal: AppDimension.paddingSmall,),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    spreadRadius: 0,
                    blurRadius: 5,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: AppDimension.paddingSmall),
                child: Column(children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(category[index]['img']),
                            fit: BoxFit.contain),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            category[index]['title'],
                            // overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ),
          onTap: _goToCategoryScreen,
        );
      },
    );
  }

  _goToCategoryScreen() {
    Get.toNamed(AppRoutes.categoryRoute, id: NestedNavigationIds.categories);
  }
}
