// To parse this JSON data, do
//
//     final apiModel = apiModelFromJson(jsonString);

import 'dart:convert';

List<ApiModel> apiModelFromJson(String str) =>
    List<ApiModel>.from(json.decode(str).map((x) => ApiModel.fromJson(x)));

String apiModelToJson(List<ApiModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ApiModel {
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  Rating rating;
  String? userId;
  int items;

  ApiModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
    this.items = 1,
    this.userId,
  });

  factory ApiModel.fromJson(Map<String, dynamic> json) => ApiModel(
      id: json["id"],
      title: json["title"],
      price: json["price"]?.toDouble(),
      description: json["description"],
      category: json["category"]!,
      image: json["image"],
      rating: Rating.fromJson(json["rating"]),
      items: json["items"] ?? 1);

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "rating": rating.toJson(),
        "items": items,
      };

  // Added copyWith method
  ApiModel copyWith({
    int? id,
    String? title,
    double? price,
    String? description,
    String? category,
    String? image,
    Rating? rating,
    String? userId,
    int? items,
  }) {
    return ApiModel(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      image: image ?? this.image,
      rating: rating ?? this.rating,
      items: items ?? this.items,
      userId: userId ?? this.userId,
    );
  }
}

class Rating {
  double rate;
  int count;

  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };

  // Added copyWith method
  Rating copyWith({
    double? rate,
    int? count,
  }) {
    return Rating(
      rate: rate ?? this.rate,
      count: count ?? this.count,
    );
  }
}
