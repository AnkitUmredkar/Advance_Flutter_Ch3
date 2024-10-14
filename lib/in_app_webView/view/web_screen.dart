import 'package:advance_flutter_ch3/in_app_webView/view/web_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WebScreen extends StatelessWidget {
  WebScreen({super.key});

  final List<Map<String, String>> eCommercePlatforms = [
    {
      "title": "Flip Kart",
      "url": "https://www.flipkart.com",
      "img":
          "https://yt3.googleusercontent.com/cT40lDWqE99Ch52R3ftuAExjmjF-yZiY5rUSv_0Q3NXhcqzmiax8ReXuS4Qe53Fizcaw4hEX=s900-c-k-c0x00ffffff-no-rj"
    },
    {
      "title": "Amazon",
      "url": "https://www.amazon.in",
      "img": "https://m.media-amazon.com/images/I/51HCHFclmmL.jpg"
    },
    {
      "title": "Myntra",
      "url": "https://www.myntra.com",
      "img":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4dJnTniYbwmtGJ3cyPX-AaLOPGtXWDkvdJA&s"
    },
    {
      "title": "Meesho",
      "url": "https://www.meesho.com",
      "img":
          "https://upload.wikimedia.org/wikipedia/commons/3/33/Meesho_logo.png"
    },
    {
      "title": "eBay",
      "url": "https://www.ebay.com/",
      "img":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEcambUGx7gfJtgNaeppxqpX-VgkL88h2h0w&s"
    },
    {
      "title": "Shopsy",
      "url": "https://www.shopsy.in/",
      "img":
          "https://5.imimg.com/data5/ANDROID/Default/2022/7/OV/BZ/OY/88779524/product-jpeg-500x500.jpg"
    },
    {
      "title": "snapdeal",
      "url": "https://snapdeal.com/",
      "img":
          "https://play-lh.googleusercontent.com/2oG3lRN6SomHM0MoGLWkmZje3_61ijVrTnJcmchr1h46QQwYPycmnhUOoPi9G8ytWY4"
    },
    {
      "title": "indiaMART",
      "url": "https://www.indiamart.com/",
      "img":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxzdoX5TedBiCNqCr1UKQCxjWTb0gCEaozbA&s"
    },
  ];

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {}, icon: Icon(Icons.search, color: Colors.white))
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
          eCommercePlatforms[index]['url']!,
          eCommercePlatforms[index]['title']!,
          eCommercePlatforms[index]['img']!,
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
