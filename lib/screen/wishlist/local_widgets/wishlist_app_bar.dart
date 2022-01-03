import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class WishlistAppBar extends StatelessWidget {
  const WishlistAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).backgroundColor,
      centerTitle: false,
      title: Text('wishlist'.tr, style: Theme.of(context).textTheme.headline6!),
      floating: true,
    );
  }
}
