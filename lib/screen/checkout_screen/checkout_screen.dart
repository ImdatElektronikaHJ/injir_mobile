import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/controller/checkout_controller.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';

import 'local_widgets/line_painter.dart';
import 'local_widgets/payment/payment.dart';
import 'local_widgets/shipping_address/shipping_address.dart';
import 'local_widgets/shipping_method/shipping_method.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen>
    with TickerProviderStateMixin {
  late final AnimationController _firstLineController;
  late final AnimationController _secondLineController;
  late final PageController _pageController;

  @override
  void initState() {
    _firstLineController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _secondLineController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(
      init: CheckoutController(
        firstLineController: _firstLineController,
        secondLineController: _secondLineController,
        pageController: _pageController,
      ),
      builder: (controller) => Container(
        color: AppColors.whiteColor,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const SizedBox(
              height: AppDimension.paddingLarge,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimension.paddingMedium),
              child: CustomPaint(
                willChange: true,
                painter: LinePainter(
                    firstAnimation: controller.firstLineController,
                    secondAnimation: controller.secondLineController,
                    isShipping: controller.currentShippingMethod == 1),
                size: Size(MediaQuery.of(context).size.width, 50.0),
              ),
            ),
            const PageNames(),
            Flexible(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller.pageController,
                children: [
                  Visibility(
                    visible: controller.currentPage == 0,
                    child: ShippingMethodWidget(
                      onNextPressed: () {
                        controller.onNextTapped();
                      },
                      onShippingMethodTapped: (int shippingMethod) {
                        controller.changeCurrentShippingMethod(shippingMethod);
                      },
                      currentShippingMethod: controller.currentShippingMethod,
                    ),
                  ),
                  Visibility(
                    visible: controller.currentPage == 1,
                    child: ShippingAddressWidget(
                      onNextTapped: () {
                        controller.onNextTapped();
                      },
                      onBackTapped: () {
                        controller.onBackTapped();
                      },
                      onAddressAddTapped: () {
                        controller.onAddressAddTapped();
                      },
                    ),
                  ),
                  Visibility(
                    visible: controller.currentPage == 2,
                    child: PaymentWidget(
                      onNextTapped: () {
                        controller.onCheckoutTapped();
                      },
                      onBackTapped: () {
                        controller.onBackTapped();
                      },
                      currentPaymentMethod: controller.currentPaymentMethod,
                      onPaymentTapped: (int paymentMethod) {
                        controller.changeCurrentPaymentMethod(paymentMethod);
                      },
                      currentOnlinePaymentMethod: controller.currentOnlinePaymentMethod,
                      onOnlinePaymentMethodTapped: (int onlinePayment) {
                        controller.changeCurrentOnlinePaymentMethod(onlinePayment);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PageNames extends StatelessWidget {
  const PageNames({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimension.paddingSmall + AppDimension.paddingMedium,
        vertical: AppDimension.paddingSmall,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'delivery'.tr,
            ),
          ),
          Expanded(
              child: Text(
            'address'.tr,
            textAlign: TextAlign.center,
          )),
          Expanded(
            child: Text(
              'payment'.tr,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
