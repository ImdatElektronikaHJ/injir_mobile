import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/theme/svg_icons.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        centerTitle: false,
        title: Text('Profile'.tr, style: Theme.of(context).textTheme.headline6!),
        actions: [
          Padding(
            padding: const EdgeInsets.all(AppDimension.paddingSmall),
            child: SvgPicture.asset(
              SvgImages.login,
            ),
          ),
        ],
        floating: true,
        
      );
  }
}