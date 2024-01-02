
import 'package:flutter/material.dart';
import 'package:more_2_drive/presentation/widgets/default_appbar/default_appbar.dart';
import 'package:more_2_drive/utils/strings/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PayMobScreen extends StatelessWidget {
  const PayMobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadRequest(Uri.parse(Constants.visaUrl));
    return Scaffold(
      appBar: DefaultAppBar(title: "Paymob Integration",),
      body:
      WebViewWidget(controller: controller,)
    );
  }
}