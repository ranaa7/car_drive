class EndPoints{
  static const String getAllProducts = 'products/';
  static const String getSearchProducts = 'products/search/';
  static const String getFeaturedProducts = 'products/featured';
  static const String getSpecialCategories = 'categories/featured';
  static const String getAllCategories = 'filter/categories';
  static const String getTopCategories = 'categories/top';
  static const String getBanner = 'sliders';
  static const String login = 'auth/login';

  static const String register = 'auth/signup';

  static const String updateProfile = 'profile/update';

  static const String deleteProfile = 'auth/account-deletion';

  static const String loginPhone = 'auth/loginphone';
  static const String confirmOtp = 'auth/enterotp';
  static const String resendOtp = 'auth/resendotp';
  static const String logOut = 'auth/logout';
  static const String counters = 'profile/counters';

  static const String getorders = 'purchase-history';

  static  String getOrderDetails(int? id) => 'purchase-history-details/$id';

  static  String getOrderItem(int? id) => 'purchase-history-items/$id';
  static const String getProfileCounter = 'profile/counters';


}