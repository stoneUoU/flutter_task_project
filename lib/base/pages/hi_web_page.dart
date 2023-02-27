import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_task_project/base/config/hi_colors.dart';
import 'package:flutter_task_project/base/widget/hi_app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HiWebPage extends StatefulWidget {
  HiWebPage({Key? key, required this.urlString}) : super(key: key);
  final urlString;

  @override
  HiWebPageState createState() => HiWebPageState();
}

class HiWebPageState extends State<HiWebPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  String titleStr = "";

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return new Container(
      child: Column(
        children: [
          HiAppBar(Colors.white, color_FF303133, titleStr, color_FF303133, "",
              () {}),
          new Expanded(
            child: WebView(
                initialUrl: widget.urlString,
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) async {
                  _controller.complete(webViewController);
                  titleStr = await showingLines(webViewController) ?? "集五福 福同享";
                  setState(() {});
                },
                onProgress: (int progress) {
                  print('WebView is loading (progress : $progress%)');
                },
                javascriptChannels: <JavascriptChannel>{
                  _toasterJavascriptChannel(context),
                },
                navigationDelegate: (NavigationRequest request) {
                  if (request.url.startsWith('https://www.youtube.com/')) {
                    print('blocking navigation to $request}');
                    return NavigationDecision.prevent;
                  }
                  print('allowing navigation to $request');
                  return NavigationDecision.navigate;
                },
                onPageStarted: (String url) {
                  print('Page started loading: $url');
                },
                onPageFinished: (String url) {
                  print('Page finished loading: $url');
                },
                gestureNavigationEnabled: true,
                backgroundColor: Colors.white),
          )
        ],
      ),
    );
  }

  Future<String?> showingLines(WebViewController webViewController) async {
    String? titleString = await webViewController.getTitle();
    return titleString;
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          // ignore: deprecated_member_use
          // Scaffold.of(context).showSnackBar(
          //   SnackBar(content: Text(message.message)),
          // );
        });
  }

  Future<void> _onShowUserAgent(
      WebViewController controller, BuildContext context) async {
    // Send a message with the user agent string to the Toaster JavaScript channel we registered
    // with the WebView.
    await controller.runJavascript(
        'Toaster.postMessage("User Agent: " + navigator.userAgent);');
  }
}
