import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:tajir/screen/compare/local_widgets/compare_product_list.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/widget/rating_widget.dart';

import 'local_widgets/compare_product/compare_product.dart';
import 'local_widgets/compare_screen_app_bar.dart';
import 'local_widgets/compare_specification/compare_specification.dart';
import 'local_widgets/compare_specification/local_widgets/compare_specification_value.dart';

class CompareScreen extends StatefulWidget {
  const CompareScreen({Key? key}) : super(key: key);

  @override
  State<CompareScreen> createState() => _CompareScreenState();
}

class _CompareScreenState extends State<CompareScreen> {
  late LinkedScrollControllerGroup controllers;
  late List<ScrollController> controllersList = [];

  @override
  void initState() {
    super.initState();
    controllers = LinkedScrollControllerGroup();
    for (int i = 0; i < 15; i++) {
      controllersList.add(ScrollController());
      controllersList[i] = controllers.addAndGet();
    }
  }

  @override
  void dispose() {
    for (int i = 0; i < 15; i++) {
      controllersList[i].dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompareScreenBuild(
      controllersList: controllersList,
    );
  }
}

class CompareScreenBuild extends StatelessWidget {
  final List<ScrollController> controllersList;

  const CompareScreenBuild({Key? key, required this.controllersList})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.whiteColor,
      child: CustomScrollView(
        slivers: [
          const CompareScreenAppBar(),
          SliverToBoxAdapter(
            child: Column(
              children: [
                CompareProductList(
                  controller: controllersList[0],
                  child: const CompareProduct(),
                  onDeleteTapped: () {
                    print('tapped');
                  },
                ),
                CompareSpecification(
                  controller: controllersList[1],
                  title: 'rating'.tr,
                  child: const CompareSpecificationValue(
                    value: RatingWidget(
                      rating: 4.5,
                    ),
                  ),
                ),
                for (int i = 2; i < 15; i++)
                  CompareSpecification(
                    title: 'os version',
                    controller: controllersList[i],
                    child: CompareSpecificationValue(
                      value: Text(
                        'Android 11',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 16.0),
                      ),
                    ),
                  ),
                ElevatedButton(
                  onPressed: () {
                    print('clear list');
                  },
                  child: Text('clear_list'.tr),
                ),
                const SizedBox(
                  height: AppDimension.paddingLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
