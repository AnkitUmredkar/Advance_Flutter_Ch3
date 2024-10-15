import 'package:advance_flutter_ch3/in_app_webView/model/ecommerce_model.dart';
import 'package:advance_flutter_ch3/in_app_webView/view/web_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/global.dart';

class WebScreen extends StatelessWidget {
  const WebScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<EComModel> platform = eCommercePlatforms.map((e) => EComModel.fromMap(e)).toList();
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        titleSpacing: 7,
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.search, color: Colors.white))
        ],
        backgroundColor: Colors.blue.shade900,
        title: const Text(
          "ClickCart",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: eCommercePlatforms.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          // childAspectRatio: 16 / 4,
        ),
        itemBuilder: (context, index) => buildGridTile(
          context,
          platform[index].url,
          platform[index].title,
          platform[index].img,
        ),
      ),
    );
  }

  Widget buildGridTile(
      BuildContext context, String webUrl, String title, String img) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebView(
              title: title,
              webUrl: webUrl,
            ),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                img,
                height: 80,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue.shade800,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) =>
                const Text(
                  'Image Failed to load!',
                  style: TextStyle(color: Colors.red),
                ),
              ),
              const Gap(10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
