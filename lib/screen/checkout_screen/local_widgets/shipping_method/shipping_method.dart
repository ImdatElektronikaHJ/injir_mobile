import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tajir/screen/checkout_screen/local_widgets/page_title.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import 'local_widgets/shipping_method_container.dart';

class ShippingMethodWidget extends StatefulWidget {
  final Function onNextPressed;
  const ShippingMethodWidget({Key? key, required this.onNextPressed})
      : super(key: key);

  @override
  _ShippingMethodWidgetState createState() => _ShippingMethodWidgetState();
}

class _ShippingMethodWidgetState extends State<ShippingMethodWidget> {
  int currentMethod = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        PageTitle(title: 'shipping_method'.tr),
        ShippingMethodContainer(
          isChecked: currentMethod == 0,
          title: 'Доставка курьером',
          onPressed: () {
            _onMethodPressed(0);
          },
        ),
        ShippingMethodContainer(
          isChecked: currentMethod == 1,
          title: 'Самовывоз',
          onPressed: () {
            _onMethodPressed(1);
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
            onPressed: () {
              widget.onNextPressed();
            },
            child: Text('next'.tr.toUpperCase()),
          ),
        ),
      ],
    );
  }

  _onMethodPressed(int i) {
    setState(() {
      currentMethod = i;
    });
  }
}
