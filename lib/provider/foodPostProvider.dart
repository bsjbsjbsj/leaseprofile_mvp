import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_leaseprofile/model/foodPostModel.dart';

class FoodPostProvider with ChangeNotifier {
  List<FoodPostModel> _foodShops = [];
  List<FoodPostModel> get foodShops => _foodShops;

  void getParsed() async {
    String jsonString = await rootBundle.loadString('assets/foodPostData.json');
    final JsonResponse = json.decode(jsonString);
    final List<FoodPostModel> parsedResponse =
        JsonResponse.map<FoodPostModel>((json) => FoodPostModel.fromJson(json))
            .toList();
    _foodShops = parsedResponse;
    notifyListeners();
  }
}
