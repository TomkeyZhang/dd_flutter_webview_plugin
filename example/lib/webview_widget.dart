import 'package:flutter/material.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
String selectedUrl = 'https://igc.ndev.imdada.cn/html#/rules';

class WebviewWidget extends StatefulWidget {
  @override
  _WebviewWidgetState createState() => _WebviewWidgetState();
}

class _WebviewWidgetState extends State<WebviewWidget> {
  final flutterWebViewPlugin = FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();
    flutterWebViewPlugin.onWebviewMessage.listen((String message) {
          print('message:$message');
        });
  }
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: selectedUrl,
      appBar: AppBar(
        title: const Text('Widget WebView'),
      ),
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
      initialChild: Container(
        color: Colors.redAccent,
        child: const Center(
          child: Text('Waiting.....'),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                flutterWebViewPlugin.goBack();
              },
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: () {
                flutterWebViewPlugin.goForward();
              },
            ),
            IconButton(
              icon: const Icon(Icons.autorenew),
              onPressed: () {
                flutterWebViewPlugin.reload();
              },
            ),
          ],
        ),
      ),
    );
  }

}
