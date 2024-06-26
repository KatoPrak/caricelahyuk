import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewPage extends StatefulWidget {
  final WebViewController controller; // Tambahkan parameter controller
  const WebviewPage({Key? key, required this.controller}) : super(key: key);

  @override
  State<WebviewPage> createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    // Inisialisasi WebViewController dari parameter yang diterima
    _controller = widget.controller;
    _controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
            print("Loading progress: $progress%");
          },
          onPageStarted: (String url) {
            print("Page started loading: $url");
          },
          onPageFinished: (String url) {
            print("Page finished loading: $url");
          },
          onWebResourceError: (WebResourceError error) {
            print("Error loading page: $error");
          },
          onNavigationRequest: (NavigationRequest request) {
            print("Navigation request to: ${request.url}");
            if (request.url.startsWith('http://10.170.6.204/map.html')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('http://10.170.6.204/map.html'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(
        // Gunakan WebView dari paket webview_flutter
        controller: _controller,
      ),
    );
  }
}
