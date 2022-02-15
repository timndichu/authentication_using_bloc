class Product {
  String title;
  num id;
  num price;
  String description;
  String category;
  String image;
  Map<String, dynamic> rating;

  Product.fromJson(Map json)
      : title = json["title"],
        price = json["price"],
        id = json["id"],
        description = json["description"],
        category = json["category"],
        image = json["image"],
        rating = json["rating"];
}
