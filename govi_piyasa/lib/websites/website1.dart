import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Website1 extends StatefulWidget {
  //const Website1({Key? key}) : super(key: key);

  @override
  _Website1State createState() => _Website1State();
}

class _Website1State extends State<Website1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: "https://www.agrimin.gov.lk/web/",
      ),
    );
  }
}
