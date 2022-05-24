import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/const/app_routes.dart';
import 'package:tajir/const/nested_navigation_ids.dart';

class CheckoutController extends GetxController {
  int currentPaymentMethod = 0;
  int currentShippingMethod = 0;
  int currentAddress = 0;
  int currentPage = 0;
  int currentOnlinePaymentMethod = -1;

  final AnimationController firstLineController;
  final AnimationController secondLineController;
  final PageController pageController;

  CheckoutController(
      {required this.firstLineController,
      required this.secondLineController,
      required this.pageController});

  void changeCurrentPaymentMethod(int paymentMethod) {
    if (currentPaymentMethod != paymentMethod) {
      currentPaymentMethod = paymentMethod;
      update();
    }
    if (paymentMethod == 2) {
      currentOnlinePaymentMethod = 0;
      update();
    } else {
      if (currentOnlinePaymentMethod != -1) {
        currentOnlinePaymentMethod = -1;
        update();
      }
    }
  }

  void changeCurrentAddress(int address) {
    if (currentAddress != address) {
      currentAddress = address;
      update();
    }
  }

  void onAddressAddTapped() {
    Get.toNamed(AppRoutes.profileAddressRoute, id: NestedNavigationIds.cart);
  }

  void changeCurrentShippingMethod(int shippingMethod) {
    if (currentShippingMethod != shippingMethod) {
      currentShippingMethod = shippingMethod;
      update();
    }
  }

  void onBackTapped() {
    if (currentShippingMethod == 1) {
      pageController.animateToPage(currentPage - 2,
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
      secondLineController
          .reverse()
          .then((value) => firstLineController.reverse());
      currentPage -= 2;
      update();
    } else {
      if (firstLineController.isCompleted && secondLineController.isDismissed) {
        if (currentPage > 0) {
          pageController.animateToPage(currentPage - 1,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut);
          firstLineController.reverse();

          currentPage--;
          update();
        }
      }
      if (secondLineController.isCompleted) {
        if (currentPage > 0) {
          pageController.animateToPage(currentPage - 1,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut);
          secondLineController.reverse();
          currentPage--;
          update();
        }
      }
    }
  }

  void onNextTapped() {
    if (currentShippingMethod == 1) {
      pageController.animateToPage(currentPage + 2,
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
      firstLineController
          .forward()
          .then((value) => secondLineController.forward());
      currentPage += 2;
      update();
    } else {
      if (firstLineController.isDismissed) {
        pageController.animateToPage(currentPage + 1,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut);
        firstLineController.forward();
        currentPage++;
        update();
      }
      if (secondLineController.isDismissed && firstLineController.isCompleted) {
        pageController.animateToPage(currentPage + 1,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut);
        secondLineController.forward();
        currentPage++;
        update();
      }
    }
  }

  void changeCurrentOnlinePaymentMethod(int value) {
    if (currentPaymentMethod != 2) {
      currentPaymentMethod = 2;
      currentOnlinePaymentMethod = value;
      update();
    } else if (currentOnlinePaymentMethod != value) {
      currentOnlinePaymentMethod = value;
      update();
    }
  }

  void onCheckoutTapped() {
    Get.toNamed(AppRoutes.checkoutSummaryRoute, id: NestedNavigationIds.cart);
  }

  @override
  void dispose() {
    firstLineController.dispose();
    secondLineController.dispose();
    super.dispose();
  }
}
