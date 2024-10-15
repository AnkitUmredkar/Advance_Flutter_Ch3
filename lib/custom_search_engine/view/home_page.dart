import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchEngine extends StatefulWidget {
  const CustomSearchEngine({super.key});

  @override
  State<CustomSearchEngine> createState() => _HomePageState();
}

class _HomePageState extends State<CustomSearchEngine> {
  InAppWebViewController? _webViewController;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.blue.shade800,
        title: const Text(
          'Custom Search Engine',
          style: TextStyle(color: Colors.white),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 13.5),
            child: FaIcon(
              FontAwesomeIcons.google,
              color: Colors.white,
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size(width, 40),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Container(
              alignment: Alignment.center,
              child: TextField(
                onSubmitted: (value) {
                  _webViewController?.loadUrl(
                    urlRequest: URLRequest(
                      url: WebUri("https://www.google.com/search?q=$value"),
                    ),
                  );
                },
                decoration: InputDecoration(
                  filled: true,
                  prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Search here..",
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: WebUri("https://www.google.com")),
          onWebViewCreated: (controller) {
            _webViewController = controller;
          },
        ),
      ),
    );
  }
}

//InAppWebView(
//   initialUrlRequest: URLRequest(url: WebUri("https://www.google.com/search?q=${value.search}")),
// ),