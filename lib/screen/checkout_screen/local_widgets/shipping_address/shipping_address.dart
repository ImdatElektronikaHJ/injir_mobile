import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../bottom_buttons.dart';
import '../page_title.dart';
import 'local_widgets/add_new_address_button.dart';
import 'local_widgets/address_title_with_icon.dart';
import 'local_widgets/my_address_checkbox.dart';
import 'local_widgets/shipping_address_container.dart';

class ShippingAddressWidget extends StatefulWidget {
  final Function onBackPressed;
  final Function onNextPressed;
  const ShippingAddressWidget(
      {Key? key, required this.onBackPressed, required this.onNextPressed})
      : super(key: key);

  @override
  _ShippingAddressWidgetState createState() => _ShippingAddressWidgetState();
}

class _ShippingAddressWidgetState extends State<ShippingAddressWidget> {
  int currentMethod = 0;
  int addresses = 2;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: PageTitle(title: 'shipping_address'.tr),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              for (int i = 0; i < addresses; i++)
                ShippingAddressContainer(
                  onPressed: () {
                    _onAddressPressed(i);
                  },
                  child: Column(
                    children: [
                      MyAddressCheckbox(
                        isChecked: currentMethod == i,
                      ),
                      const AddressTitleWithIcon(
                        title: 'Muhammed Artykov',
                        icon: CupertinoIcons.person,
                      ),
                      const AddressTitleWithIcon(
                        title: 'S.Turkmenbashy sayoly, 25/22, 12',
                        icon: CupertinoIcons.location,
                      ),
                      const AddressTitleWithIcon(
                        title: '+99364059026',
                        icon: CupertinoIcons.phone,
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: AddNewAddressButton(
            onAddNewAddressPressed: () {
              _onAddNewAddressPressed();
            },
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
        const SliverToBoxAdapter(
          child: SizedBox(
            height: AppDimension.paddingExtraLarge,
          ),
        ),
      ],
    );
  }

  _onAddNewAddressPressed() {
    setState(() {
      addresses++;
    });
  }

  _onAddressPressed(int i) {
    setState(() {
      currentMethod = i;
    });
  }
}
