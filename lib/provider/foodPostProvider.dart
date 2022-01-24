import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_leaseprofile/model/foodPostModel.dart';

class foodPostProvider with ChangeNotifier {
  List<FoodPostModel> _foodShops = [];
  List<FoodPostModel> get foodShops => _foodShops;

  void getParsed() async {
    String jsonString = await rootBundle.loadString('assets/foodPostData.json');
    final JsonResponse = json.decode(jsonString);
    final List<FoodPostModel> parsedResponse =
        JsonResponse.map<FoodPostModel>((json) => FoodPostModel.fromJson(json))
            .toList();
    debugPrint(parsedResponse[0].desc!.hash);
    _foodShops = parsedResponse;
    notifyListeners();
  }
}
