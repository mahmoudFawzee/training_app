import 'dart:developer';
import 'dart:io';

import 'package:flutter_training/work_with_pagination/data/end_points/end_points.dart';
import 'package:flutter_training/work_with_pagination/data/models/passenger.dart';
import 'package:http/http.dart' as http;

class PassengersService {
  static int _currentPage = 1;
  static int? _numberOfPages;
  PassengersService._internal();
  static final _passengersService = PassengersService._internal();
  factory PassengersService() {
    return _passengersService;
  }

  static Future<List<Passenger>?> getPassengers({
    required bool isInitial,
  }) async {
    try {
      log('isInitial : $isInitial');
      if (isInitial) {
        _currentPage = 1;
      } else if (_currentPage == _numberOfPages) {
        return [];
      }
      final url = EndPoint.getUrl(_currentPage);
      final uri = Uri.parse(url);
      var response = await http.get(uri);
      if (response.statusCode == HttpStatus.ok) {
        final result = passengersDataFromJson(response.body);
        _currentPage++;
        if (isInitial) _numberOfPages = result.totalPages;
        return result.data;
      }
      return null;
    } catch (e) {
      log('error');
      log(e.toString());
      return null;
    }
  }
}
//!if your refresh so we need the first page and page index will be 1
//!if we need to load more pages so we will use the current value of the current page var.