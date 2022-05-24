import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tajir/screen/checkout_screen/local_widgets/page_title.dart';
import 'package:tajir/screen/checkout_screen/local_widgets/payment/local_widgets/payment_method_container_expanded.dart';
import 'package:tajir/theme/app_dimension.dart';

import '../bottom_buttons.dart';
import 'local_widgets/payment_method_container.dart';

class PaymentWidget extends StatelessWidget {
  final void Function() onBackTapped;
  final void Function() onNextTapped;
  final int currentPaymentMethod;
  final int currentOnlinePaymentMethod;
  final void Function(int) onPaymentTapped;
  final void Function(int) onOnlinePaymentMethodTapped;

  const PaymentWidget(
      {Key? key,
      required this.onBackTapped,
      required this.onNextTapped,
      required this.currentPaymentMethod,
      required this.onPaymentTapped,
      required this.currentOnlinePaymentMethod,
      required this.onOnlinePaymentMethodTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: PageTitle(title: 'payment'.tr),
        ),
        SliverToBoxAdapter(
          child: PaymentMethodContainer(
              isChecked: currentPaymentMethod == 0,
              title: 'Наличными',
              onPressed: () {
                onPaymentTapped(0);
              }),
        ),
        SliverToBoxAdapter(
          child: PaymentMethodContainer(
              isChecked: currentPaymentMethod == 1,
              title: 'Картой',
              onPressed: () {
                onPaymentTapped(1);
              }),
        ),
        SliverToBoxAdapter(
          child: PaymentMethodContainerExpanded(
            isMainTitleChecked: currentPaymentMethod == 2,
            title: 'Онлайн',
            onMainTitleTapped: () {
              onPaymentTapped(2);
            },
            onSubTitleTapped: (int value) {
              onOnlinePaymentMethodTapped(value);
            },
            currentSubTitleIndex: currentOnlinePaymentMethod,
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: AppDimension.marginExtraLarge,
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
      ],
    );
  }
}
