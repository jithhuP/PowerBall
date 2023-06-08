import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewExample extends StatefulWidget {
  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  @override
  void initState() {
    super.initState();
    // WebView 초기화
    WebView.platform = SurfaceAndroidWebView(); // 안드로이드에서 사용하기 위한 설정
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebView Example'),
      ),
      body: WebView(
        initialUrl: 'https://jhlov.github.io/baseball/', // 연결할 웹 페이지 URL
        javascriptMode: JavascriptMode.unrestricted, // 웹 페이지의 JavaScript 허용
      ),
    );
  }
}
