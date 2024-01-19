class EndPoints{
  static const String getAllProducts = 'products/';
  static const String getRelatedProducts = 'products/related/';
  static const String getSearchProducts = 'products/search/';
  static const String getFeaturedProducts = 'products/featured';
  static const String getProductOfCategories = 'products/category/';
  static const String getProductOfBrands = 'products/brand/';
  static const String getSpecialCategories = 'categories/featured';
  static const String getAllCategories = 'categories';
  static const String getTopCategories = 'categories/top';
  static const String getBanner = 'sliders';
  static const String login = 'auth/login';

  static const String register = 'auth/signup';

  static const String socialLogin = 'auth/social-login';

  static const String updateProfile = 'profile/update';

  static const String deleteProfile = 'auth/account-deletion';

  static const String loginPhone = 'auth/loginphone';
  static const String confirmOtp = 'auth/enterotp';
  static const String resendOtp = 'auth/resendotp';
  static const String logOut = 'auth/logout';
  static const String getUserDataByToken = 'get-user-by-access_token';
  static const String counters = 'profile/counters';

  static const String getorders = 'purchase-history';

  static  String getOrderDetails(int? id) => 'purchase-history-details/$id';

  static  String getOrderItem(int? id) => 'purchase-history-items/$id';
  static const String getProfileCounter = 'profile/counters';

  static const String getBrands = 'brands';
  static const String addCart = 'carts/add';
  static const String getCartList = 'carts';
  static const String updateCart = 'carts/process';
  static const String getCartCount = 'cart-count';
  static const String getCarBrands = 'car_brands';
  static const String getCarBrandsModel = 'models-by-brands/';
  static const String addCar = 'user/car/add_car_user';
  static const String getUserCars = 'user/cars/caruser';
  static const String updateUserCar = 'user/car/update';

  static const String getPickupPoint = 'pickup-list';
  static const String updateShippingTypeInCart = 'update-shipping-type-in-cart';
  static const String updatePickupDateInCart = 'update-pickup-date-in-cart';
  static const String getPaymentTypes = 'payment-types';
  static const String getCartSummary = 'cart-summary';
  static const String applyCoupon = 'coupon-apply';
  static const String removeCoupon = 'coupon-remove';
  static const String getUserAddress = 'user/shipping/address';
  static const String createUserAddress = 'user/shipping/create';
  static const String getStateByCountry = 'states-by-country/64';
  static const String getCityByState = 'cities-by-state/';
  static const String addProductToWishlist = 'wishlists-add-product';
  static const String removeProductFromWishlist = 'wishlists-remove-product';

  static const String getWishlist = 'wishlists';
  static const String checkIfProductIsInWishlist = 'wishlists-check-product';



  static const String convertIntoWallet = 'clubpoint/convert-into-wallet';
  static const String getClubpoints = 'clubpoint/get-list';


  static const String walletBalance = 'wallet/balance';

  static const String walletHistory = 'wallet/history';

  static const String pushNotification = 'https://fcm.googleapis.com/fcm/send';

}