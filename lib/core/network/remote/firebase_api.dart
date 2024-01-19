import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../../../core/functions/show_toast.dart';
import '../../../../main.dart';

var deviceToken;

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initToken() async {

    deviceToken= await _firebaseMessaging.getToken();
    print(deviceToken);

  }


  Future<void> firebaseMessaging()async {

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the console!');
      if (message.notification != null) {
        print('Message data: ${message.data}');
        print('Notification Title: ${message.notification?.title}');
        print('Notification Body: ${message.notification?.body}');
        showToast(message: "on message", bcColor:Colors.green);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      if (message.notification != null) {
        print('Message data: ${message.data}');
        print('Notification Title: ${message.notification?.title}');
        print('Notification Body: ${message.notification?.body}');
        showToast(message: "message on open app", bcColor:Colors.green);
      }
    });

    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }

}
