import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class BottomButtons extends StatelessWidget {
  final Function onBackPressed;
  final Function onNextPressed;
  final String? title;

  const BottomButtons(
      {Key? key,
      required this.onBackPressed,
      required this.onNextPressed,
      this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimension.marginLarge + AppDimension.marginExtraLarge,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: AppDimension.paddingMedium),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppColors.lightGreyColor,
                  elevation: 0.0,
                ),
                onPressed: () {
                  onBackPressed();
                },
                child: Text('back'.tr.toUpperCase(),
                    style: Theme.of(context).textTheme.button!.copyWith(
                          color: AppColors.blackColor,
                        )),
              ),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                onNextPressed();
              },
              child: Text(title?.toUpperCase() ?? 'next'.tr.toUpperCase()),
            ),
          ),
        ],
      ),
    );
  }
}
