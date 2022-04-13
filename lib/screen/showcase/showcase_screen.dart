import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tajir/const/app_routes.dart';
import 'package:tajir/screen/showcase/local_widgets/showcase_action_button.dart';
import 'package:tajir/screen/showcase/local_widgets/showcase_banner_widget.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:get/get.dart';
import 'package:tajir/widget/become_seller_button.dart';

class ShowcaseScreen extends StatefulWidget {
  const ShowcaseScreen({Key? key}) : super(key: key);

  @override
  State<ShowcaseScreen> createState() => _ShowcaseScreenState();
}

class _ShowcaseScreenState extends State<ShowcaseScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white),
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const ShowcaseBannerWidget(),
                const SizedBox(
                  height: AppDimension.paddingLarge,
                ),
                ShowcaseActionButton(
                  child: Text(
                    'sign_in'.tr.toUpperCase(),
                    overflow: TextOverflow.ellipsis,
                  ),
                  onActionTapped: _signInTapped,
                ),
                ShowcaseActionButton(
                  child: Text(
                    'sign_up'.tr.toUpperCase(),
                    overflow: TextOverflow.ellipsis,
                  ),
                  onActionTapped: _signUpTapped,
                ),
                BecomeSellerButton(
                  onActionTapped: _becomeSellerTapped,
                ),
                ShowcaseActionButton(
                  child: Text(
                    'skip'.tr.toUpperCase(),
                    overflow: TextOverflow.ellipsis,
                  ),
                  onActionTapped: _skipTapped,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _signInTapped() {
    Get.toNamed(AppRoutes.loginRoute);
  }

  _signUpTapped() {
    Get.toNamed(AppRoutes.registrationRoute);
  }

  _becomeSellerTapped() {}

  _skipTapped() {
    Get.offAndToNamed(AppRoutes.dashboardRoute);
  }
}
