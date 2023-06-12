import 'dart:convert';
import 'package:eat_delivery_flutter/domain/entity/citchen_list.dart';
import 'package:http/http.dart' as http;

class CitchenListService {

  Future<CitchenList> fetchCitchenList({query}) async {
    var url =
        'https://run.mocky.io/v3/c7a508f2-a904-498a-8539-09d96785446e';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return CitchenList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load');
    }
  }
const CitchenListService();
}