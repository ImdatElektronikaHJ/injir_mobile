import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/svg_icons.dart';

class ProfileAppBar extends StatelessWidget {
  final void Function() onLogoutTapped;
  final bool isLoggedIn;
  const ProfileAppBar(
      {Key? key, required this.onLogoutTapped, this.isLoggedIn = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).backgroundColor,
      centerTitle: false,
      title: Text('profile'.tr, style: Theme.of(context).textTheme.headline6!),
      actions: [
        isLoggedIn
            ? ElevatedButton(
                onPressed: onLogoutTapped,
                style: ElevatedButton.styleFrom(
                  primary: AppColors.whiteColor,
                  elevation: 0.0,
                ),
                child: SvgPicture.asset(
                  SvgImages.login,
                ),
              )
            : SizedBox(),
      ],
      floating: true,
    );
  }
}
