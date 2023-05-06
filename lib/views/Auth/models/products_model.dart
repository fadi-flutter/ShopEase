import 'dart:math';

class Products {
  // int? id;
  String? title;
  // String? description;
  int? price;
  double? discountPercentage;
  num? rating;
  // int? stock;
  String? brand;
  // String? category;
  String? thumbnail;
  int? reviews;
  // List<String>? images;

  Products({
    // {this.id,
    this.title,
    // this.description,
    this.price,
    this.reviews,
    this.discountPercentage,
    this.rating,
    // this.stock,
    this.brand,
    // this.category,
    this.thumbnail,
    // this.images,
  });

  Random random = Random();
  Products.fromJson(Map<String, dynamic> json) {
    int randomNumber = random.nextInt(400) + 3;
    // id = json['id'];
    title = json['title'];
    reviews = randomNumber;

    // description = json['description'];
    price = json['price'];
    discountPercentage = json['discountPercentage'];
    rating = json['rating'];
    // stock = json['stock'];
    brand = json['brand'];
    // category = json['category'];
    thumbnail = json['thumbnail'];
    // images = List.from(json['images']);
  }
}
