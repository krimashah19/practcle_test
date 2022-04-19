import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class NewsWebPage extends StatelessWidget {
  final String url;

  NewsWebPage({Key key,  this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
