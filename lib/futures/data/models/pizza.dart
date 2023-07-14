import 'dart:ffi';

import 'package:flutter_training/futures/data/keys/json_keys.dart';

class Pizza {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final String price;
  const Pizza({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
  });
  factory Pizza.fromJson({required Map<String, dynamic> jsonObj}) {
    final id = jsonObj[JsonKeys.id];
    final name = jsonObj[JsonKeys.name].toString();
    final description = jsonObj[JsonKeys.description].toString();
    final imageUrl = jsonObj[JsonKeys.imageUrl].toString();
    final price = jsonObj[JsonKeys.price].toString();
    return Pizza(
      id: id,
      name: name,
      description: description,
      imageUrl: imageUrl,
      price: price,
    );
  }
  @override
  String toString() {
    return ' {\n id:$id, \n name : $name, \n url : $imageUrl, \n description : $description, \n price : $price, \n }';
  }
}
