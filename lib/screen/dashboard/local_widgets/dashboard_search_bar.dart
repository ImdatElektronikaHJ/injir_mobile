import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tajir/theme/app_animation.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';

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
  late FocusNode _searchFocusNode;
  late TextEditingController _searchController;

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
    _searchController = TextEditingController();
    _searchFocusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return SizeTransition(
            axisAlignment: -1.0,
            sizeFactor: _curveAnimation,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: AppDimension.paddingSmall,
                  horizontal: AppDimension.paddingMedium),
              child: TextField(
                controller: _searchController,
                focusNode: _searchFocusNode,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: Colors.white),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: AppDimension.paddingMedium,
                      vertical: AppDimension.paddingSmall),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColors.lightGreyColor,
                  ),
                  hintText: 'search'.tr,
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: AppColors.lightGreyColor),
                  border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(AppDimension.borderRadiusSmall),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: AppColors.lightGreyColor.withOpacity(0.2),
                ),
              ),
            ),
          );
        });
  }

  updateExpandStatus(bool isExpanded) {
    if (isExpanded) {
      _searchController.clear(); //TODO: remove it later, attach listener on search controller
      FocusScope.of(context).requestFocus(_searchFocusNode);
      _controller.forward();
    } else {
      FocusScope.of(context).requestFocus(FocusNode());
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
