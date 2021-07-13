import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Image.asset("assets/images/clixlogo.png",fit: BoxFit.scaleDown,),
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: args,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
