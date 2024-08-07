// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class ProductModel {
  final String description;
  final List<String> imagesUrl;
  final String name;
  final String price;
  final String weight;
  final num rating;
  final String quantity;
  final int ratingCount;

  final bool isOffer;
  final num purchaseCount;
  final String producttId;
  final String? categoryName;

  ProductModel({
    required this.description,
    required this.imagesUrl,
    required this.name,
    required this.price,
    required this.weight,
    required this.rating,
    required this.quantity,
    required this.ratingCount,
    required this.isOffer,
    required this.purchaseCount,
    required this.producttId,
    required this.categoryName,
  });

  ProductModel copyWith({
    String? description,
    List<String>? imagesUrl,
    String? name,
    String? price,
    String? weight,
    num? rating,
    String? quantity,
    int? ratingCount,
    bool? isOffer,
    num? purchaseCount,
    String? producttId,
    String? categoryName,
  }) {
    return ProductModel(
      description: description ?? this.description,
      imagesUrl: imagesUrl ?? this.imagesUrl,
      name: name ?? this.name,
      price: price ?? this.price,
      weight: weight ?? this.weight,
      rating: rating ?? this.rating,
      quantity: quantity ?? this.quantity,
      ratingCount: ratingCount ?? this.ratingCount,
      isOffer: isOffer ?? this.isOffer,
      purchaseCount: purchaseCount ?? this.purchaseCount,
      producttId: producttId ?? this.producttId,
      categoryName: categoryName ?? this.categoryName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'imagesUrl': imagesUrl,
      'name': name,
      'price': price,
      'weight': weight,
      'rating': rating,
      'quantity': quantity,
      'ratingCount': ratingCount,
      'isOffer': isOffer,
      'purchaseCount': purchaseCount,
      'producttId': producttId,
      'categoryName': categoryName,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      description: map['description'] as String,
      imagesUrl: List<String>.from((map['imagesUrl'] as List<dynamic>)),
      name: map['name'] as String,
      price: map['price'] as String,
      weight: map['weight'] as String,
      rating: map['rating'] as num,
      quantity: map['quantity'] as String,
      ratingCount: map['ratingCount'] as int,
      isOffer: map['isOffer'] as bool,
      purchaseCount: map['purchaseCount'] as num,
      producttId: map['producttId'] as String,
      categoryName:
          map['categoryName'] != null ? map['categoryName'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(description: $description, imagesUrl: $imagesUrl, name: $name, price: $price, weight: $weight, rating: $rating, quantity: $quantity, ratingCount: $ratingCount, isOffer: $isOffer, purchaseCount: $purchaseCount, producttId: $producttId, categoryName: $categoryName)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.description == description &&
        listEquals(other.imagesUrl, imagesUrl) &&
        other.name == name &&
        other.price == price &&
        other.weight == weight &&
        other.rating == rating &&
        other.quantity == quantity &&
        other.ratingCount == ratingCount &&
        other.isOffer == isOffer &&
        other.purchaseCount == purchaseCount &&
        other.producttId == producttId &&
        other.categoryName == categoryName;
  }

  @override
  int get hashCode {
    return description.hashCode ^
        imagesUrl.hashCode ^
        name.hashCode ^
        price.hashCode ^
        weight.hashCode ^
        rating.hashCode ^
        quantity.hashCode ^
        ratingCount.hashCode ^
        isOffer.hashCode ^
        purchaseCount.hashCode ^
        producttId.hashCode ^
        categoryName.hashCode;
  }
}
