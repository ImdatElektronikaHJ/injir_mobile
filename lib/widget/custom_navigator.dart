import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/const/app_routes.dart';
import 'package:tajir/screen/address/address_screen.dart';
import 'package:tajir/screen/become_seller/become_seller_screen.dart';
import 'package:tajir/screen/category/category_screen.dart';
import 'package:tajir/screen/checkout_screen/checkout_screen.dart';
import 'package:tajir/screen/checkout_summary/checkout_summary_screen.dart';
import 'package:tajir/screen/compare/compare_screen.dart';
import 'package:tajir/screen/compare_categories/compare_categories_screen.dart';
import 'package:tajir/screen/edit_profile/edit_profile_screen.dart';
import 'package:tajir/screen/product/product_screen.dart';
import 'package:tajir/screen/search/search_screen.dart';
import 'package:tajir/screen/wishlist/wishlist_screen.dart';

class CustomNavigator extends StatelessWidget {
  final Widget initialRoute;
  final int nestedId;

  const CustomNavigator(
      {required this.initialRoute, required this.nestedId, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(nestedId),
      onGenerateRoute: _routes(initialRoute),
    );
  }

  RouteFactory _routes(Widget initialRoute) {
    return (settings) {
      final Map<String, dynamic>? arguments =
          settings.arguments as Map<String, dynamic>?;
      Widget screen;
      switch (settings.name) {
        case AppRoutes.defaultRoute:
          screen = initialRoute;
          break;

        case AppRoutes.categoryRoute:
          screen = const CategoryScreen();
          break;

        case AppRoutes.productRoute:
          screen = const ProductScreen();
          break;

        case AppRoutes.compareRoute:
          screen = const CompareScreen();
          break;
        case AppRoutes.profileAddressRoute:
          screen = const AddressScreen();
          break;

        case AppRoutes.editProfileRoute:
          screen = const EditProfileScreen();
          break;

        case AppRoutes.compareCategoriesRoute:
          screen = const CompareCategoriesScreen();
          break;

        case AppRoutes.checkoutRoute:
          screen = const CheckoutScreen();
          break;

        case AppRoutes.checkoutSummaryRoute:
          screen = const CheckoutSummaryScreen();
          break;

        case AppRoutes.searchRoute:
          screen = const SearchScreen();
          break;

        case AppRoutes.becomeSellerRoute:
          screen = const BecomeSellerScreen();
          break;

        case AppRoutes.wishlistRoute:
          screen = const WishlistScreen();
          break;

        default:
          return null;
      }
      return GetPageRoute(
          routeName: settings.name,
          page: () => screen,
          transition: Transition.downToUp,
          curve: Curves.fastOutSlowIn);
    };
  }
}
