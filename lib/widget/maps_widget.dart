import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'dart:io';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Map'),
          backgroundColor: Color.fromARGB(255, 137, 197, 169),
        ),
        body: WebView(
          initialUrl: '', 
          onWebViewCreated: (WebViewController webViewController) {
            
          },
          javascriptMode: JavascriptMode.unrestricted,
        ));
  }

  void _loadHtmlFromAssets() async {
    String fileText = await rootBundle.loadString('lib/widget/map.html');
    _controller.loadFlutterAsset(Uri.dataFromString(fileText,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}
