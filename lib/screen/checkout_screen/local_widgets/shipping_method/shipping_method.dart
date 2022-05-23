import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tajir/screen/checkout_screen/local_widgets/page_title.dart';
import 'package:tajir/theme/app_button_style.dart';
import 'package:tajir/theme/app_dimension.dart';

import 'local_widgets/shipping_method_container.dart';

class ShippingMethodWidget extends StatefulWidget {
  final void Function() onNextPressed;
  final void Function(int) onShippingMethodTapped;
  final int currentShippingMethod;
  const ShippingMethodWidget(
      {Key? key,
      required this.onNextPressed,
      required this.onShippingMethodTapped,
      required this.currentShippingMethod})
      : super(key: key);

  @override
  _ShippingMethodWidgetState createState() => _ShippingMethodWidgetState();
}

class _ShippingMethodWidgetState extends State<ShippingMethodWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        PageTitle(title: 'shipping_method'.tr),
        ShippingMethodContainer(
          isChecked: widget.currentShippingMethod == 0,
          title: 'Доставка курьером',
          onPressed: () {
            widget.onShippingMethodTapped(0);
          },
        ),
        ShippingMethodContainer(
          isChecked: widget.currentShippingMethod == 1,
          title: 'Самовывоз',
          onPressed: () {
            widget.onShippingMethodTapped(1);
          },
        ),
        const SizedBox(
          height: 50.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal:
                  AppDimension.marginLarge + AppDimension.marginExtraLarge,
              vertical: AppDimension.paddingMedium),
          child: ElevatedButton(
            style: AppButtonStyle.elevatedButtonStyleMedium,
            onPressed: () {
              widget.onNextPressed();
            },
            child: Text('next'.tr.toUpperCase()),
          ),
        ),
      ],
    );
  }
}
