import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_leaseprofile/model/fakeModel.dart';

class PostProvider with ChangeNotifier {
  List<FakeModel> _posts = [];

  List<FakeModel> shopList() {
    _fetchData();
    return _posts;
  }

  Future<void> _fetchData() async {
    String jsonString = await rootBundle.loadString('assets/fakeData.json');
    final JsonResponse = json.decode(jsonString);
    final List<FakeModel> parsedResponse =
        JsonResponse.map<FakeModel>((json) => FakeModel.fromJson(json))
            .toList();
    _posts.clear;
    _posts.addAll(parsedResponse);
    notifyListeners();
  }
}
