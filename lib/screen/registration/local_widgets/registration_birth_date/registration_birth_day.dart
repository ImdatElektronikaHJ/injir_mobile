import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tajir/theme/app_dimension.dart';

import 'local_widgets/registration_dropdown.dart';

class RegistrationBirthDay extends StatelessWidget {
  const RegistrationBirthDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimension.paddingMedium,
          vertical: AppDimension.paddingSmall),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'birth_date'.tr,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  fontSize: 14.0,
                ),
          ),
          Row(
            children: const [
              Expanded(child: RegistrationDropdownButton()),
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppDimension.paddingMedium,
                      vertical: AppDimension.paddingSmall / 2,
                    ),
                    child: RegistrationDropdownButton(),
                  )),
              Expanded(
                child: RegistrationDropdownButton(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
