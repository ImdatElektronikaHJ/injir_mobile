import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/localization/localization_service.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/theme/app_text_style.dart';

import '../../controller/language_controller.dart';
import '../../theme/app_colors.dart';

class LanguageScreen extends StatelessWidget {
  final controller = Get.find<LanguageController>();
  LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final langs = LocalizationService.langs;
    return ColoredBox(
      color: Get.theme.backgroundColor,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              'language'.tr,
              style: Get.textTheme.titleMedium,
            ),
            backgroundColor: AppColors.whiteColor,
            centerTitle: true,
            iconTheme: const IconThemeData(color: AppColors.blackColor),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                bool isChecked = controller.currentIndex.value == index;
                return GestureDetector(
                  onTap: () {
                    controller.changeLanguage(langs[index]);
                  },
                  child: AnimatedContainer(
                    height: 50.0,
                    duration: const Duration(milliseconds: 150),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(
                          AppDimension.borderRadiusMedium),
                    ),
                    padding: const EdgeInsets.all(AppDimension.paddingMedium),
                    margin: const EdgeInsets.symmetric(
                        horizontal: AppDimension.paddingMedium),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            langs[index],
                            maxLines: 3,
                            style: AppTextStyle.avenirBold.copyWith(
                              color: isChecked
                                  ? AppColors.blueColor
                                  : AppColors.blackColor,
                            ),
                          ),
                        ),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 150),
                          child: isChecked
                              ? const Icon(
                                  CupertinoIcons.checkmark_square_fill,
                                  key: Key('true'),
                                  color: AppColors.blueColor,
                                )
                              : const Icon(
                                  CupertinoIcons.square,
                                  key: Key('false'),
                                  color: AppColors.blackColor,
                                ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: langs.length,
            ),
          ),
        ],
      ),
    );
  }
}
