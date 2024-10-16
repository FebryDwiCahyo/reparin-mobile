import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../controllers/webview_controller.dart';

class HelpWebView extends GetView<ArticleDetailController> {
  const HelpWebView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help Page"),
      ),
      body: WebViewWidget(
        controller: controller.loadHelpPage(),
      ),
    );
  }
}
