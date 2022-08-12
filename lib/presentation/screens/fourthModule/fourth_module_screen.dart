import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FourthModuleScreen extends StatefulWidget {
  const FourthModuleScreen({Key? key}) : super(key: key);

  @override
  FourthModuleScreenState createState() => FourthModuleScreenState();
}

class FourthModuleScreenState extends State<FourthModuleScreen> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  bool showLoader = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebView(
          onPageFinished: (value) {
            setState(() {
              showLoader = !showLoader;
            });
          },
          initialUrl: 'https://flutter.dev',
        ),
        if (showLoader)
          const Center(
            child: CircularProgressIndicator(),
          )
      ],
    );
  }
}
