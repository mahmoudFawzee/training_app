import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_training/futures/data/end_points/end_points.dart';
import 'package:flutter_training/futures/data/models/pizza.dart';

class PizzaService {
  static Future<String> _readJsonFile(BuildContext context) async {
    String myString =
        await DefaultAssetBundle.of(context).loadString(EndPoints.file_url);
    return myString;
  }

  static Future<List<Pizza>> getPizza(BuildContext context) async {
    List<Pizza> pizzaList = [];
    final data = await _readJsonFile(context);
    final jsonList = jsonDecode(data);
    print(jsonList);
    for (var item in jsonList) {
      final pizza = Pizza.fromJson(jsonObj: item);
      pizzaList.add(pizza);
    }
    return pizzaList;
  }
}
