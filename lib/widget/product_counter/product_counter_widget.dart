import 'package:flutter/material.dart';
import 'package:tajir/theme/app_dimension.dart';

import 'local_widgets/product_counter_widget_button.dart';

class ProductCounterWidget extends StatelessWidget {
  final void Function()? onIncrementTapped;
  final void Function()? onDecrementTapped;
  final int? count;
  const ProductCounterWidget(
      {Key? key, this.onIncrementTapped, this.onDecrementTapped, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        ProductCounterWidgetButton(
          title: '-',
          onButtonTapped: () {
            onDecrementTapped!();
          },
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(AppDimension.paddingSmall),
            child: Text(
              '$count',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        ProductCounterWidgetButton(
          title: '+',
          onButtonTapped: () {
            onIncrementTapped!();
          },
        ),
      ],
    );
  }
}
