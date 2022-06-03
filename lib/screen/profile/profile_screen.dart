import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tajir/const/app_routes.dart';
import 'package:tajir/const/nested_navigation_ids.dart';
import 'package:tajir/controller/account_controller.dart';
import 'package:tajir/controller/account_login_status_controller.dart';
import 'package:tajir/screen/profile/local_widgets/profile_app_bar.dart';
import 'package:tajir/theme/app_button_style.dart';
import 'package:tajir/theme/svg_icons.dart';
import 'package:tajir/widget/error_screen.dart';

import '../../theme/app_dimension.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountLoginStatusController>(
      builder: (controller) {
        final accountController = Get.find<AccountController>();
        return CustomScrollView(
          slivers: [
            ProfileAppBar(
              onLogoutTapped: () {
                accountController.logout();
              },
              isLoggedIn:
                  controller.accountLoginStatus == AccountLoginStatus.loggedIn,
            ),
            SliverVisibility(
              visible:
                  controller.accountLoginStatus != AccountLoginStatus.loading &&
                      controller.accountLoginStatus != AccountLoginStatus.error,
              sliver: SliverToBoxAdapter(
                child: ListTile(
                  leading: SvgPicture.asset(
                    SvgImages.lang,
                  ),
                  title: Text('Language',
                      style: Theme.of(context).textTheme.subtitle2!),
                  trailing: SvgPicture.asset(
                    SvgImages.arrowright,
                  ),
                ),
              ),
            ),
            SliverVisibility(
                visible: controller.accountLoginStatus ==
                    AccountLoginStatus.notLoggedIn,
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppDimension.marginExtraLarge,
                            vertical: AppDimension.paddingSmall / 2),
                        child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed(AppRoutes.loginRoute);
                          },
                          style: AppButtonStyle.elevatedButtonStyleLarge,
                          child: Text('sign_in'.tr),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppDimension.marginExtraLarge,
                            vertical: AppDimension.paddingSmall / 2),
                        child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed(AppRoutes.registrationRoute);
                          },
                          style: AppButtonStyle.elevatedButtonStyleLarge,
                          child: Text('sign_up'.tr),
                        ),
                      ),
                    ],
                  ),
                )),
            SliverVisibility(
              visible:
                  controller.accountLoginStatus == AccountLoginStatus.loggedIn,
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    ListTile(
                      leading: SvgPicture.asset(
                        SvgImages.person,
                      ),
                      title: Text('Edit Profile',
                          style: Theme.of(context).textTheme.subtitle2!),
                      trailing: SvgPicture.asset(
                        SvgImages.arrowright,
                      ),
                      onTap: () => _goToEditProfileScreen(),
                    ),
                    ListTile(
                      leading: SvgPicture.asset(
                        SvgImages.local,
                      ),
                      title: Text('Address',
                          style: Theme.of(context).textTheme.subtitle2!),
                      trailing: SvgPicture.asset(
                        SvgImages.arrowright,
                      ),
                      onTap: () {
                        _goToEditProfileScreen();
                      },
                    ),
                    ListTile(
                      leading: SvgPicture.asset(
                        SvgImages.clock,
                      ),
                      title: Text('Order History',
                          style: Theme.of(context).textTheme.subtitle2!),
                      trailing: SvgPicture.asset(
                        SvgImages.arrowright,
                      ),
                      onTap: () {
                        _goToOrderHistoryScreen();
                      },
                    ),
                  ],
                ),
              ),
            ),
            SliverVisibility(
              visible:
                  controller.accountLoginStatus == AccountLoginStatus.error,
              sliver: SliverFillRemaining(
                hasScrollBody: false,
                child: ErrorScreen(
                  onRetryTapped: () {
                    accountController.fetchAccount();
                  },
                ),
              ),
            ),
            SliverVisibility(
              visible:
                  controller.accountLoginStatus == AccountLoginStatus.loading,
              sliver: const SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  _goToEditProfileScreen() {
    Get.toNamed(AppRoutes.editProfileRoute, id: NestedNavigationIds.profile);
  }

  _goToOrderHistoryScreen() {
    Get.toNamed(AppRoutes.orderHistoryRoute, id: NestedNavigationIds.profile);
  }
}
