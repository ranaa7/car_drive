import 'package:dio/dio.dart';
import 'package:more_2_drive/utils/strings/constants.dart';

class PayMobManager {
  Future<String> getPaymentKey(int amount, String currency) async {
    try {
      String authenticationToken = await _getAuthenticationToken();
      int orderId = await _getOrderId(
        authanticationToken: authenticationToken,
        amount: (100 * amount).toString(),
        currency: currency,
      );

      String paymentKey = await _getPaymentKey(
        authanticationToken: authenticationToken,
        amount: (100 * amount).toString(),
        currency: currency,
        orderId: orderId.toString(),
      );
      return paymentKey;
    } catch (e) {
      print("Exc==========================================");
      print(e.toString());
      throw Exception();
    }
  }

  Future<String> _getAuthenticationToken() async {
    final Response response =
        await Dio().post("https://accept.paymob.com/api/auth/tokens", data: {
      "api_key":
          "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T0RNek5UWTBMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuaDE3Z2RCd2RYNjhqd012TUJhNTNSX2kxeTI3aElaRzhFYVAxYjUxZF9TVGFwQ2VfRFlrVlgwOVFkdmpMV2R1ZHd1N0pCSGJOZnNpMEtmNTQ5Ul9NQWc="
    });
    return response.data["token"];
  }

  Future<int> _getOrderId({
    required String authanticationToken,
    required String amount,
    required String currency,
  }) async {
    final Response response = await Dio()
        .post("https://accept.paymob.com/api/ecommerce/orders", data: {
      "auth_token": authanticationToken,
      "amount_cents": amount, //  >>(STRING)<<
      "currency": currency, //Not Req
      "delivery_needed": "false",
      "items": [
        {
          "name": "ASC1515",
          "amount_cents": "500000",
          "description": "Smart Watch",
          "quantity": "1"
        },
        {
          "name": "ERT6565",
          "amount_cents": "200000",
          "description": "Power Bank",
          "quantity": "1"
        }
      ],
    });
    return response.data["id"]; //INTGER
  }

  Future<String> _getPaymentKey({
    required String authanticationToken,
    required String orderId,
    required String amount,
    required String currency,
  }) async {
    final Response response = await Dio()
        .post("https://accept.paymob.com/api/acceptance/payment_keys", data: {
      //ALL OF THEM ARE REQIERD
      "expiration": 3600,

      "auth_token": authanticationToken, //From First Api
      "order_id": orderId, //From Second Api  >>(STRING)<<
      "integration_id": 3953500, //Integration Id Of The Payment Method

      "amount_cents": amount,
      "currency": currency,

      "billing_data": {
        //Have To Be Values
        "first_name": "Clifford",
        "last_name": "Nicolas",
        "email": "claudette09@exa.com",
        "phone_number": "+86(8)9135210487",

        //Can Set "NA"
        "apartment": "NA",
        "floor": "NA",
        "street": "NA",
        "building": "NA",
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "NA",
        "state": "NA"
      },
    });
    return Constants.paymentFinalToken = response.data["token"];
  }
}
