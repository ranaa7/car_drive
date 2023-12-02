// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/foundation.dart';

class ResponseModel {
  dynamic success;
  dynamic message;
  dynamic messageAr;
  dynamic data;

  ResponseModel.fromJson(String jsonString) {
    try {
      final json = jsonDecode(jsonString);
      success = json['success'];
      message = json['message'];
      messageAr = json['messageAR'];
      data = json;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
