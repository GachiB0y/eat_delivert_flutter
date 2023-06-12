import 'dart:convert';

import 'package:eat_delivery_flutter/domain/entity/categoryList.dart';
import 'package:http/http.dart' as http;

class CategoryListService {

   Future<CategoryList> fetchCategoryList({query}) async {
    var url =
        'https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return CategoryList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load');
    }
  }
  const CategoryListService();

}