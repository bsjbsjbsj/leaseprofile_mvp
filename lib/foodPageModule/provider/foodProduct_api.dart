import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_leaseprofile/foodPageModule/model/foodProduct_model.dart';
import 'package:get/state_manager.dart';

var baseUrl = Uri.parse('http://10.0.2.2:8000/foodpage/');

class FoodProductApi extends GetxController {
  final http.Client httpClient = http.Client();

  getAll() async {
    var response = await httpClient.get(baseUrl);
    if (response.statusCode == 200) {
      final JsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
      final List<FoodProductModel> parsedResponse =
          JsonResponse.map<FoodProductModel>(
              (json) => FoodProductModel.fromJson(json)).toList();
      print(parsedResponse[0].product_carbonhydrate);
      return parsedResponse;
    } else {
      throw Exception('Failed to load http get');
    }
  }
}
