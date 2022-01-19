import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tajir/screen/checkout_screen/local_widgets/page_title.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/util/card_number_input_formatted.dart';
import 'package:tajir/util/expiry_date_input_formatter.dart';
import 'package:tajir/widget/simple_text_field_with_hint.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../bottom_buttons.dart';
import 'local_widgets/card_container.dart';

class PaymentWidget extends StatefulWidget {
  final Function onBackPressed;
  final Function onNextPressed;
  const PaymentWidget(
      {Key? key, required this.onBackPressed, required this.onNextPressed})
      : super(key: key);

  @override
  State<PaymentWidget> createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
  TextEditingController codeController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cardNameController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: PageTitle(title: 'payment'.tr)),
        CardContainer(
          expiryTime: expiryDateController.text.toUpperCase(),
          codeText: codeController.text.toUpperCase(),
          cardHolder: cardNameController.text.toUpperCase(),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal:
                    AppDimension.marginLarge * 2 - AppDimension.paddingSmall),
            child: Column(
              children: [
                SimpleTextFieldWithHint(
                  fieldName: 'Name on Card',
                  controller: cardNameController,
                  placeHolder: 'First & Last Name',
                  maxLength: 30,
                  onValueChanged: (text) {
                    setState(() {});
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-z ]')),
                  ],
                ),
                SimpleTextFieldWithHint(
                  fieldName: 'Street',
                  maxLength: 19,
                  controller: codeController,
                  placeHolder: 'XXXX XXXX XXXX XXXX',
                  onValueChanged: (text) {
                    setState(() {});
                  },
                  inputFormatters: [
                    CardNumberInputFormatter(),
                    FilteringTextInputFormatter.allow(RegExp('[0-9 ]')),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: SimpleTextFieldWithHint(
                        fieldName: 'Expiry Date',
                        maxLength: 5,
                        controller: expiryDateController,
                        placeHolder: 'MM/YY',
                        onValueChanged: (text) {
                          setState(() {});
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[0-9 /]')),
                          ExpiryDateInputFormatter(),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SimpleTextFieldWithHint(
                        fieldName: 'CVV',
                        controller: cvvController,
                        maxLength: 4,
                        onValueChanged: (text) {},
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                        ],
                        obscureText: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: BottomButtons(
            onBackPressed: () {
              widget.onBackPressed();
            },
            onNextPressed: () {
              widget.onNextPressed();
            },
          ),
        ),
      ],
    );
  }
}
