import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tajir/theme/app_dimension.dart';

import '../bottom_buttons.dart';
import '../page_title.dart';
import 'local_widgets/add_new_address_button.dart';
import 'local_widgets/address_title_with_icon.dart';
import 'local_widgets/my_address_checkbox.dart';
import 'local_widgets/shipping_address_container.dart';

class ShippingAddressWidget extends StatelessWidget {
  final void Function() onBackTapped;
  final void Function() onNextTapped;
  final void Function() onAddressAddTapped;
  final void Function(int) onAddressChangeTapped;
  final int currentAddress;

  const ShippingAddressWidget(
      {Key? key,
      required this.onBackTapped,
      required this.onNextTapped,
      required this.onAddressAddTapped,
      required this.onAddressChangeTapped,
      required this.currentAddress})
      : super(key: key);

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
              for (int i = 0; i < 2; i++)
                ShippingAddressContainer(
                  onPressed: () {
                    onAddressChangeTapped(i);
                  },
                  child: Column(
                    children: [
                      MyAddressCheckbox(
                        isChecked: currentAddress == i,
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
              onAddressAddTapped();
            },
          ),
        ),
        SliverToBoxAdapter(
          child: BottomButtons(
            onBackTapped: () {
              onBackTapped();
            },
            onNextTapped: () {
              onNextTapped();
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
}
