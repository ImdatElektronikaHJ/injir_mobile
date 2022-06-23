import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';

class AnimatedLikeButton extends StatelessWidget {
  final bool isInWishList;
  final Function() onFavoriteTapped;

  const AnimatedLikeButton(
      {Key? key, required this.isInWishList, required this.onFavoriteTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onFavoriteTapped();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: AppDimension.paddingSmall,
            horizontal: AppDimension.paddingMedium),
        color: Colors.transparent,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 150),
          transitionBuilder: (child, animation) {
            return ScaleTransition(
              scale: Tween(begin: 0.15, end: 1.2).animate(
                CurvedAnimation(parent: animation, curve: Curves.bounceOut),
              ),
              child: child,
            );
          },
          child: isInWishList
              ? const Icon(
                  CupertinoIcons.heart_fill,
                  key: Key('true'),
                  color: AppColors.redColor,
                  size: 22.0,
                )
              : const Icon(
                  CupertinoIcons.heart,
                  key: Key('false'),
                  color: AppColors.redColor,
                  size: 22.0,
                ),
        ),
      ),
    );
  }
}
