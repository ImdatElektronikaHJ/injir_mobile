import 'package:flutter/material.dart';
import 'package:tajir/theme/app_animation.dart';

class DashboardSearchBar extends StatefulWidget {
  final bool isExpanded;

  const DashboardSearchBar({Key? key, this.isExpanded = false})
      : super(key: key);

  @override
  State<DashboardSearchBar> createState() => _DashboardSearchBarState();
}

class _DashboardSearchBarState extends State<DashboardSearchBar>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _curveAnimation;

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return SizeTransition(
            axisAlignment: 1.0,
            sizeFactor: _curveAnimation,
            child: SizedBox(
              height: kBottomNavigationBarHeight,
              width: MediaQuery.of(context).size.width,
              child: const ColoredBox(
                color: Colors.amber,
              ),
            ),
          );
        });
  }

  updateExpandStatus(bool isExpanded) {
    if (isExpanded) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void didUpdateWidget(covariant DashboardSearchBar oldWidget) {
    if (oldWidget.isExpanded != widget.isExpanded) {
      updateExpandStatus(widget.isExpanded);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
