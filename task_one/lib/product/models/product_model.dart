// To parse this JSON data, do
//
//     final modelPost = modelPostFromMap(jsonString);

import 'dart:convert';

List<ModelPost> modelPostFromMap(String str) =>
    List<ModelPost>.from(json.decode(str).map((x) => ModelPost.fromMap(x)));

String modelPostToMap(List<ModelPost> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ModelPost {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  ModelPost({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  factory ModelPost.fromMap(Map<String, dynamic> json) => ModelPost(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: json["rating"] == null ? null : Rating.fromMap(json["rating"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "rating": rating?.toMap(),
      };
}

class Rating {
  double? rate;
  int? count;

  Rating({
    this.rate,
    this.count,
  });

  factory Rating.fromMap(Map<String, dynamic> json) => Rating(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toMap() => {
        "rate": rate,
        "count": count,
      };
}
