import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tajir/const/app_routes.dart';
import 'package:tajir/const/nested_navigation_ids.dart';
import 'package:tajir/controller/account_controller.dart';
import 'package:tajir/controller/account_login_status_controller.dart';
import 'package:tajir/screen/profile/local_widgets/profile_app_bar.dart';
import 'package:tajir/theme/svg_icons.dart';
import 'package:tajir/widget/error_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<AccountLoginStatusController>(
      builder: (controller) {
        final accountController = Get.find<AccountController>();
        return CustomScrollView(
          slivers: [
            ProfileAppBar(
              onLogoutTapped: () {
                accountController.logout();
              },
              isLoggedIn: controller.accountLoginStatus.value ==
                  AccountLoginStatus.loggedIn,
            ),
            SliverVisibility(
              visible: controller.accountLoginStatus.value !=
                      AccountLoginStatus.loading &&
                  controller.accountLoginStatus.value !=
                      AccountLoginStatus.error,
              sliver: SliverToBoxAdapter(
                child: ListTile(
                  onTap: () {
                    _goToLanguageScreen();
                  },
                  leading: SvgPicture.asset(
                    SvgImages.lang,
                  ),
                  title: Text('language'.tr,
                      style: Theme.of(context).textTheme.subtitle2!),
                  trailing: SvgPicture.asset(
                    SvgImages.arrowright,
                  ),
                ),
              ),
            ),
            SliverVisibility(
                visible: controller.accountLoginStatus.value ==
                    AccountLoginStatus.notLoggedIn,
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ListTile(
                        leading: SvgPicture.asset(
                          SvgImages.person,
                        ),
                        title: Text('sign_in'.tr,
                            style: Theme.of(context).textTheme.subtitle2!),
                        trailing: SvgPicture.asset(
                          SvgImages.arrowright,
                        ),
                        onTap: () => _goToSignInScreen(),
                      ),
                      ListTile(
                        leading: SvgPicture.asset(
                          SvgImages.person,
                        ),
                        title: Text('sign_up'.tr,
                            style: Theme.of(context).textTheme.subtitle2!),
                        trailing: SvgPicture.asset(
                          SvgImages.arrowright,
                        ),
                        onTap: () => _goToSignUpScreen(),
                      ),
                    ],
                  ),
                )),
            SliverVisibility(
              visible: controller.accountLoginStatus.value ==
                  AccountLoginStatus.loggedIn,
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    ListTile(
                      leading: SvgPicture.asset(
                        SvgImages.person,
                      ),
                      title: Text('edit_profile'.tr,
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
                      title: Text('address'.tr,
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
                      title: Text('order_history'.tr,
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
              visible: controller.accountLoginStatus.value ==
                  AccountLoginStatus.error,
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
              visible: controller.accountLoginStatus.value ==
                  AccountLoginStatus.loading,
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

  _goToLanguageScreen() {
    Get.toNamed(AppRoutes.changeLanguageRoute, id: NestedNavigationIds.profile);
  }

  _goToSignUpScreen() {
    Get.toNamed(AppRoutes.registrationRoute);
  }

  _goToSignInScreen() {
    Get.toNamed(AppRoutes.loginRoute);
  }
}
