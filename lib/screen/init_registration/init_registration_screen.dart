import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/screen/init_registration/local_widget/init_registration_app_bar.dart';
import 'package:tajir/screen/init_registration/local_widget/init_registration_title_widget.dart';
import 'package:tajir/theme/app_dimension.dart';

class InitRegistrationScreen extends StatelessWidget {
  final _registrationFormKey = GlobalKey<FormState>();
  InitRegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.backgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            InitRegistrationAppBar(
              onBackTapped: () {},
            ),
            SliverToBoxAdapter(
              child: Form(
                key: _registrationFormKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDimension.paddingExtraLarge),
                  child: Column(
                    children: [
                      const InitRegistrationTitleWidget(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
