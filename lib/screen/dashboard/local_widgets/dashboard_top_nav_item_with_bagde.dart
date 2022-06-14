import 'package:flutter/material.dart';
import 'package:tajir/theme/app_animation.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';

class DashboardTopNavItemWithBadge extends StatefulWidget {
  final int value;
  final int groupValue;
  final IconData iconData;
  final VoidCallback? onTapped;
  final String? tooltip;
  final bool? badge;

  const DashboardTopNavItemWithBadge(
      {Key? key,
      required this.value,
      required this.groupValue,
      required this.iconData,
      this.tooltip,
      this.onTapped,
      this.badge = false})
      : super(key: key);

  @override
  State<DashboardTopNavItemWithBadge> createState() =>
      _DashboardTopNavItemWithBadgeState();
}

class _DashboardTopNavItemWithBadgeState
    extends State<DashboardTopNavItemWithBadge> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _curveAnimation;
  late final Animation<Color?> _colorAnimation;
  late final Animation<double> _scaleAnimation;

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

    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 1.2).animate(_curveAnimation);

    _colorAnimation =
        ColorTween(begin: AppColors.lightGreyColor, end: Colors.white)
            .animate(_curveAnimation);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Stack(
            // alignment: Alignment.center,
            children: [
              Center(
                child: IconButton(
                  splashRadius: Material.defaultSplashRadius * 2 / 3,
                  iconSize: AppDimension.iconSizeSmall,
                  onPressed: widget.onTapped,
                  tooltip: widget.tooltip,
                  icon: Icon(
                    widget.iconData,
                    color: _colorAnimation.value,
                  ),
                ),
              ),
              Positioned(
                  top: AppDimension.topBadgePositionTop,
                  right: AppDimension.topBadgePositionRight,
                  child: AnimatedSwitcher(
                    key: const Key('true'),
                    duration: const Duration(milliseconds: 150),
                    child: widget.badge!
                        ? Container(
                            height: AppDimension.badgeSize,
                            width: AppDimension.badgeSize,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.redColor),
                          )
                        : const SizedBox(),
                  )),
            ],
          ),
        );
      },
    );
  }

  @override
  void didUpdateWidget(covariant DashboardTopNavItemWithBadge oldWidget) {
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
