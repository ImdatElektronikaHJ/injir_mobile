import 'package:flutter/material.dart';
import 'package:tajir/widget/shimmer_loading/sliding_gradient_transform.dart';

class ShimmerWidget extends StatefulWidget {
  static ShimmerWidgetState? of(BuildContext context) {
    return context.findAncestorStateOfType<ShimmerWidgetState>();
  }

  final Widget? child;
  final LinearGradient linearGradient;

  const ShimmerWidget({Key? key, this.child, required this.linearGradient})
      : super(key: key);

  @override
  ShimmerWidgetState createState() => ShimmerWidgetState();
}

class ShimmerWidgetState extends State<ShimmerWidget>
    with SingleTickerProviderStateMixin {
  LinearGradient get gradient => LinearGradient(
        colors: widget.linearGradient.colors,
        stops: widget.linearGradient.stops,
        begin: widget.linearGradient.begin,
        end: widget.linearGradient.end,
        transform:
            SlidingGradientTransform(slidePercent: _shimmerController.value),
      );

  late AnimationController _shimmerController;

  AnimationController get shimmerChanges => _shimmerController;

  bool get isSized => (context.findRenderObject() as RenderBox).hasSize;

  Size get size => (context.findRenderObject() as RenderBox).size;

  Offset getDescendantOffset({
    required RenderBox descendant,
    Offset offset = Offset.zero,
  }) {
    final shimmerBox = context.findRenderObject() as RenderBox;
    return descendant.localToGlobal(offset, ancestor: shimmerBox);
  }

  @override
  void initState() {
    super.initState();

    _shimmerController = AnimationController.unbounded(vsync: this)
      ..repeat(min: -0.5, max: 1.5, period: const Duration(milliseconds: 1500));
  }

  @override
  Widget build(BuildContext context) {
    return widget.child ?? const SizedBox();
  }
}
