enum APIPath {
  fetchToken,
  fetchProducts,
  fetchCategories,
  fetchBanners,
  fetchFeaturedProducts,
  fetchAccount,
  fetchCart,
  fetchCartBulk,
  fetchWishList,
  fetchLogin,
  fetchRegistration,
  fetchCartEmpty,
  fetchInformation,
  fetchContact,
  fetchLogout,
  fetchPassword,
  fetchAccountAddresses,
  fetchOrders,
  fetchShippingAddresses,
  fetchPaymentAddresses,
  fetchShippingMethods,
  fetchPaymentMethods,
  fetchOrderConfirm,
  fetchForgotPassword,
  fetchForgotPasswordCode,
  fetchStoreInfo,
  fetchReceipt,
  fetchNewsletter,
  fetchManufacturers,
  fetchRelatedProducts,
  fetchCountries,
  fetchSpecials,
  fetchWishListClear,
  fetchPlannedList,
  fetchPlannedListProducts,
  fetchPlannedListRemoveProduct,
  fetchLatestProducts,
  fetchBestsellersProducts,
  fetchReview,
}

class APIPathHelper {
  static String getValue(APIPath path) {
    switch (path) {
      case APIPath.fetchToken:
        return "/index.php?route=feed/rest_api/gettoken&grant_type=client_credentials";
      case APIPath.fetchProducts:
        return "/index.php?route=feed/rest_api/products";
      case APIPath.fetchCategories:
        return "/index.php?route=feed/rest_api/categories";
      case APIPath.fetchBanners:
        return "/index.php?route=feed/rest_api/banners";
      case APIPath.fetchFeaturedProducts:
        return "/index.php?route=feed/rest_api/featured";
      case APIPath.fetchAccount:
        return "/index.php?route=rest/account/account";
      case APIPath.fetchCart:
        return "/index.php?route=rest/cart/cart";
      case APIPath.fetchCartBulk:
        return "/index.php?route=rest/cart/bulkcart";
      case APIPath.fetchWishList:
        return "/index.php?route=rest/wishlist/wishlist";
      case APIPath.fetchLogin:
        return "/index.php?route=rest/login/login";
      case APIPath.fetchRegistration:
        return "/index.php?route=rest/register/register";
      case APIPath.fetchCartEmpty:
        return "/index.php?route=rest/cart/emptycart";
      case APIPath.fetchInformation:
        return "/index.php?route=feed/rest_api/information";
      case APIPath.fetchContact:
        return "/index.php?route=rest/contact/send";
      case APIPath.fetchLogout:
        return "/index.php?route=rest/logout/logout";
      case APIPath.fetchPassword:
        return "/index.php?route=rest/account/password";
      case APIPath.fetchAccountAddresses:
        return "/index.php?route=rest/account/address";
      case APIPath.fetchOrders:
        return "/index.php?route=rest/order/orders";
      case APIPath.fetchShippingAddresses:
        return "/index.php?route=rest/shipping_address/shippingaddress";
      case APIPath.fetchPaymentAddresses:
        return "/index.php?route=rest/payment_address/paymentaddress";
      case APIPath.fetchShippingMethods:
        return "/index.php?route=rest/shipping_method/shippingmethods";
      case APIPath.fetchPaymentMethods:
        return "/index.php?route=rest/payment_method/payments";
      case APIPath.fetchOrderConfirm:
        return "/index.php?route=rest/confirm/confirm";
      case APIPath.fetchForgotPassword:
        return "/index.php?route=rest/forgotten/forgotten";
      case APIPath.fetchForgotPasswordCode:
        return "/index.php?route=rest/cod/cod";
      case APIPath.fetchStoreInfo:
        return "/index.php?route=feed/rest_api/stores&id=0";
      case APIPath.fetchReceipt:
        return "/api/rest/sendrecept";
      case APIPath.fetchNewsletter:
        return "/index.php?route=rest/account/newsletter";
      case APIPath.fetchManufacturers:
        return "/index.php?route=feed/rest_api/manufacturers";
      case APIPath.fetchRelatedProducts:
        return "/index.php?route=feed/rest_api/related";
      case APIPath.fetchCountries:
        return "/index.php?route=feed/rest_api/countries";
      case APIPath.fetchSpecials:
        return "/index.php?route=feed/rest_api/specials";
      case APIPath.fetchWishListClear:
        return "/index.php?route=rest/wishlist/delwishlist";
      case APIPath.fetchPlannedList:
        return "/index.php?route=rest/account/plan";
      case APIPath.fetchPlannedListProducts:
        return "/index.php?route=rest/account/planproducts";
      case APIPath.fetchPlannedListRemoveProduct:
        return "/index.php?route=rest/account/plandelproduct";
      case APIPath.fetchLatestProducts:
        return "/index.php?route=feed/rest_api/latest";
      case APIPath.fetchReview:
        return "/index.php?route=feed/rest_api/reviews";

      case APIPath.fetchBestsellersProducts:
        return "/index.php?route=feed/rest_api/bestsellers"; //adding &limit={limit} required

      default:
        return "";
    }
  }
}
