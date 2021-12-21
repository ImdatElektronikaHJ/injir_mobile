import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/theme/svg_icons.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text('Profile', style: Theme.of(context).textTheme.headline6!),
        actions: [
          Padding(
            padding: const EdgeInsets.all(AppDimension.paddingSmall),
            child: SvgPicture.asset(
              SvgImages.login,
            ),
          ),
        ],
        floating: true,
        pinned: true,
      );
  }
}