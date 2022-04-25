import 'package:get/get.dart';

class AppDimension {
  AppDimension._();

  static double _contextWidth() {
    return Get.context?.width ?? 0.0;
  }

  static double fontSizeExtraSmall = _contextWidth() >= 1300 ? 14 : 10;
  static double fontSizeSmall = _contextWidth() >= 1300 ? 16 : 12;
  static double fontSizeDefault = _contextWidth() >= 1300 ? 18 : 14;
  static double fontSizeLarge = _contextWidth() >= 1300 ? 20 : 16;
  static double fontSizeExtraLarge = _contextWidth() >= 1300 ? 22 : 18;
  static double fontSizeOverLarge = _contextWidth() >= 1300 ? 28 : 24;

  static const borderRadiusMicro = 5.0;
  static const borderRadiusSmall = 10.0;
  static const borderRadiusMedium = 15.0;
  static const borderRadiusLarge = 20.0;

  static const paddingSmall = 10.0;
  static const paddingMedium = 15.0;
  static const paddingLarge = 17.0;
  static const paddingExtraLarge = 20.0;
  static const paddingOverLarge = 30.0;

  static const marginSmall = 10.0;
  static const marginMedium = 15.0;
  static const marginLarge = 20.0;
  static const marginExtraLarge = 25.0;

  static const appBarLeadingWidth = 120.0;

  static const iconSizeSmall = 24.0;
  static const iconSizeMedium = 32.0;

  static const bannerHeight = 155.0;

  static const homeCategoriesHeight = 90.0;
  static const homeCategoriesWidth = 120.0;

  static const listProductWidth = 160.0;
  static const listProductHeight = 250.0;

  static const searchProductHeight = 135.0;

  static const homeBrandsHeight = 30.0;

  static const productSliderBannerHeight = 300.0;
  static const productElevatedButtonHeight = 50.0;

  static const elevationAppBarElevation = 2.0;

  static const compareProductWithIconHeight = 350.0;
  static const compareSpecificationHeight = 35.0;

  static const cartTotalBarHeight = 80.0;
}
