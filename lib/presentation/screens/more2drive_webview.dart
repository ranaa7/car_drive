
import 'package:flutter/material.dart';
import 'package:more_2_drive/presentation/widgets/default_appbar/default_appbar.dart';
import 'package:more_2_drive/utils/strings/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class More2DriveWebView extends StatelessWidget {
  const More2DriveWebView({super.key});

  @override
  Widget build(BuildContext context) {
    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadRequest(Uri.parse(Constants.more2Drive));
    return Scaffold(
        appBar: DefaultAppBar(title: "More2Drive",),
        body:
        WebViewWidget(controller: controller,)
    );
  }
}