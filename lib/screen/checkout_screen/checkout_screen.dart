import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:tajir/const/app_routes.dart';
import 'package:tajir/const/nested_navigation_ids.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import 'local_widgets/line_painter.dart';
import 'local_widgets/payment/payment.dart';
import 'local_widgets/shipping_address/shipping_address.dart';
import 'local_widgets/shipping_method/shipping_method.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutrScreenState();
}

class _CheckoutrScreenState extends State<CheckoutScreen>
    with TickerProviderStateMixin {
  late final AnimationController _firstLineController;
  late final AnimationController _secondLineController;
  late final PageController _pageController;

  int currentIndex = 0;

  @override
  void initState() {
    _firstLineController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _secondLineController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _firstLineController.dispose();
    _secondLineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  firstAnimation: _firstLineController,
                  secondAnimation: _secondLineController),
              size: Size(MediaQuery.of(context).size.width, 50.0),
            ),
          ),
          const PageNames(),
          Flexible(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: [
                ShippingMethodWidget(
                  onNextPressed: () {
                    _onNextPressed();
                  },
                ),
                ShippingAddressWidget(
                  onNextPressed: () {
                    _onNextPressed();
                  },
                  onBackPressed: () {
                    _onBackPressed();
                  },
                ),
                PaymentWidget(
                  onNextPressed: () {
                    _onCheckoutPressed();
                  },
                  onBackPressed: () {
                    _onBackPressed();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _onCheckoutPressed() {
    Get.toNamed(AppRoutes.checkoutSummaryRoute, id: NestedNavigationIds.cart);
  }

  _onBackPressed() {
    if (_firstLineController.isCompleted && _secondLineController.isDismissed) {
      setState(() {
        if (currentIndex > 0) {
          currentIndex--;
        }
      });
      _pageController.animateToPage(currentIndex,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
      _firstLineController.reverse();
    }
    if (_secondLineController.isCompleted) {
      setState(() {
        if (currentIndex > 0) {
          currentIndex--;
        }
      });

      _pageController.animateToPage(currentIndex,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
      _secondLineController.reverse();
    }
  }

  _onNextPressed() {
    if (_firstLineController.isDismissed) {
      setState(() {
        currentIndex++;
      });
      _pageController.animateToPage(currentIndex,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
      _firstLineController.forward();
    }
    if (_secondLineController.isDismissed && _firstLineController.isCompleted) {
      setState(() {
        currentIndex++;
      });
      _pageController.animateToPage(currentIndex,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
      _secondLineController.forward();
    }
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
