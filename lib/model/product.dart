import 'package:flutter/material.dart' show IconData;

class Product {
  IconData? icon;
  String? name;
  String? img;
  String? description;
  num? price;
  num? oldPrice;

  Product({
    this.icon,
    this.img,
    this.name,
    this.description,
    this.price,
    this.oldPrice,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      icon: json['icon'],
      img: json['img'],
      name: json['title'],
      description: json['description'],
      price: json['price'],
      oldPrice: json['old_price'],
    );
  }
}
