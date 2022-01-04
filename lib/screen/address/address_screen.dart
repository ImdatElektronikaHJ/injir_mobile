import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tajir/screen/address/local_widgtes/address_screen_action_button.dart';
import 'package:tajir/screen/address/local_widgtes/address_screen_app_bar.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/widget/simple_text_field_with_hint.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const AddressScreenAppBar(),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SimpleTextFieldWithHint(
                      fieldName: "Region".tr,
                    ),
                    SimpleTextFieldWithHint(
                      fieldName: "City".tr,
                    ),
                    SimpleTextFieldWithHint(
                      fieldName: "Street".tr,
                    ),
                    SimpleTextFieldWithHint(
                      fieldName: "Address".tr,
                    ),
                    AddressScreenActionButton(
                      onActionTapped: () {},
                      title: 'save'.tr.toUpperCase(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
