import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebPage extends StatefulWidget {
  final String url;
  const WebPage({super.key,required this.url});

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  @override
  Widget build(BuildContext context) {
    late InAppWebViewController inAppWebView;
    double _progress = 0;

    return  SafeArea(
        child:Scaffold(
          body: Stack(
              children: [
                InAppWebView(
                  initialUrlRequest: URLRequest(
                      url: Uri.parse(
                          widget.url)),
                  onWebViewCreated: (controller) {
                    inAppWebView = controller;
                  },
                  onLoadStart: (controller, url) {},
                  onProgressChanged: (controller, progress) {
                    setState(() {
                      _progress = progress / 100;
                    });
                  },
                ),
                _progress < 1
                    ? SizedBox(
                        height: 3,
                        child: LinearProgressIndicator(
                          value: _progress,
                          backgroundColor: Colors.blue,
                        ),
                      )
                    : const SizedBox()
              ],
            ),
        ),
    );
  }
}
