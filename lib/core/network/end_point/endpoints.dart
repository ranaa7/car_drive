class EndPoints {
  static const String login = 'api/v2/auth/login';

  static const String register = 'api/v2/auth/signup';

  static const String loginPhone = 'api/v2/auth/loginphone';
  static const String confirmOtp = 'api/v2/auth/enterotp';
  static const String resendOtp = 'api/v2/auth/resendotp';
  static const String logOut = 'api/v2/auth/logout';

  // static const String signup = 'api/delivery/auth/register';
  // static const String updateFcmtoken = 'api/delivery/profile/fcm-token';
  // static const String pushNotification = 'https://fcm.googleapis.com/fcm/send';
  // static const String getProfile = 'api/delivery/profile';
  // static const String updateProfile = 'api/delivery/profile/update';
  // static const String getOrders = 'api/delivery/orders';
  // static const String confirmOrder = 'api/delivery/order/update';
  // static String getOrdersPathPath(String parameters) =>
  //     '$getOrders?date=$parameters';
  //
  // static String orderDetailsPath(int id) => '$getOrders/$id';
}
