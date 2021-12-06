import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';

class AnimatedLikeButton extends StatefulWidget {
  final bool isInWishList;
  final Function(bool isInWishList) onFavoriteTapped;

  const AnimatedLikeButton(
      {Key? key, required this.isInWishList, required this.onFavoriteTapped})
      : super(key: key);
  @override
  _AnimatedLikeButtonState createState() => _AnimatedLikeButtonState();
}

class _AnimatedLikeButtonState extends State<AnimatedLikeButton> {
  bool _isInWishList = false;
  // ignore: prefer_function_declarations_over_variables
  Function(bool isInWishList) _onFavoriteTapped = (bool isInWishList) {};

  @override
  void initState() {
    _isInWishList = widget.isInWishList;
    _onFavoriteTapped = widget.onFavoriteTapped;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _onFavoriteTapped(!_isInWishList);

        //TODO: remove
        setState(() {
          _isInWishList = !_isInWishList;
        });
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
          child: _isInWishList
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

  _favoriteUpdated(bool isInWishList) {
    setState(() {
      _isInWishList = isInWishList;
    });
  }

  @override
  void didUpdateWidget(covariant AnimatedLikeButton oldWidget) {
    if (widget.isInWishList != oldWidget.isInWishList) {
      _favoriteUpdated(widget.isInWishList);
    }
    super.didUpdateWidget(oldWidget);
  }
}
