import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ApplyCareController extends GetxController {
  var controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        //onPageStarted: (String url) {},
        //onPageFinished: (String url) {},
        //onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('http://www.1661-2129.or.kr/sub02/sub020101_01.do')); //=> 웹뷰에 연결할 URL  //
  //https://flutter.dev
  WebViewController getController() {
    return controller;
  }
}


