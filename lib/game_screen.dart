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

