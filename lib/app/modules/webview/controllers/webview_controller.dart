import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetailController extends GetxController {
  WebViewController loadHelpPage() {
    const helpUrl = 'https://www.ifixit.com';
    return WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(helpUrl));
  }
}
