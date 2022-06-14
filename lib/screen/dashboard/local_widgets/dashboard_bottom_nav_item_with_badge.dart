import 'package:flutter/material.dart';
import 'package:tajir/theme/app_animation.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';

class DashboardBottomNavItemWithBadge extends StatefulWidget {
  final int value;
  final int groupValue;
  final IconData iconData;
  final VoidCallback? onTapped;
  final String? tooltip;
  final bool? badge;

  const DashboardBottomNavItemWithBadge(
      {Key? key,
      required this.value,
      required this.groupValue,
      required this.iconData,
      this.onTapped,
      this.tooltip,
      this.badge = false})
      : super(key: key);

  @override
  State<DashboardBottomNavItemWithBadge> createState() =>
      _DashboardBottomNavItemWithBadgeState();
}

class _DashboardBottomNavItemWithBadgeState
    extends State<DashboardBottomNavItemWithBadge>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _curveAnimation;
  late final Animation<Color?> _colorAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: AppAnimation.durationMedium),
      vsync: this,
    );

    _curveAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );

    _colorAnimation = ColorTween(
            begin: AppColors.darkerGreyColor, end: AppColors.darkBlueColor)
        .animate(_curveAnimation);

    if (widget.value == widget.groupValue) {
      _controller.forward();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Stack(
          children: [
            IconButton(
              splashRadius: Material.defaultSplashRadius * 2 / 3,
              iconSize: AppDimension.iconSizeSmall,
              onPressed: widget.onTapped,
              tooltip: widget.tooltip,
              icon: Icon(
                widget.iconData,
                color: _colorAnimation.value,
              ),
            ),
            Positioned(
              top: AppDimension.bottomBadgePositionTop,
              right: AppDimension.bottomBadgePositionRight,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 150),
                child: widget.badge!
                    ? Container(
                        key: const Key('true'),
                        height: AppDimension.badgeSize,
                        width: AppDimension.badgeSize,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.redColor,
                        ),
                      )
                    : const SizedBox(),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void didUpdateWidget(covariant DashboardBottomNavItemWithBadge oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.groupValue != oldWidget.groupValue) {
      if (widget.groupValue == widget.value) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
