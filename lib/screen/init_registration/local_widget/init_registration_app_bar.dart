import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/theme/app_dimension.dart';


class InitRegistrationAppBar extends StatelessWidget {
  final void Function()? onBackTapped;
  const InitRegistrationAppBar({Key? key, this.onBackTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      floating: true,
      delegate: InitRegistrationAppBarDelegate(onBackTapped),
    );
  }
}

class InitRegistrationAppBarDelegate extends SliverPersistentHeaderDelegate {
  final void Function()? onBackTapped;
  InitRegistrationAppBarDelegate([this.onBackTapped]);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: AppDimension.paddingMedium),
      alignment: Alignment.centerLeft,
      color: Get.theme.backgroundColor,
      child: IconButton(
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        onPressed: onBackTapped,
        icon: const Icon(Icons.arrow_back),
      ),
    );
  }

  @override
  double get minExtent => kToolbarHeight;

  @override
  double get maxExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
