class EComModel {
  late String title, url, img;

  EComModel({required this.title, required this.url, required this.img});

  factory EComModel.fromMap(Map m1) {
    return EComModel(title: m1["title"], url: m1["url"], img: m1["img"]);
  }
}
