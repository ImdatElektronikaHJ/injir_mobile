import 'package:flutter/material.dart';
import 'package:tajir/theme/app_dimension.dart';

import 'local_widgets/product_counter_widget_button.dart';

class ProductCounterWidget extends StatefulWidget {
  final Function onCartDeleteTapped;
  const ProductCounterWidget({Key? key, required this.onCartDeleteTapped})
      : super(key: key);

  @override
  _ProductCounterWidgetState createState() => _ProductCounterWidgetState();
}

class _ProductCounterWidgetState extends State<ProductCounterWidget> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        ProductCounterWidgetButton(
          title: '-',
          onButtonTapped: () {
            if (count <= 1) {
              widget.onCartDeleteTapped();
            } else {
              setState(() {
                count -= 1;
              });
            }
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
            setState(() {
              if (count < 99999) count += 1;
            });
          },
        ),
      ],
    );
  }
}
