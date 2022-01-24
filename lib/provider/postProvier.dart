import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_leaseprofile/model/fakeModel.dart';

class PostProvider with ChangeNotifier {
  List<FakeModel> _shops = [];
  List<FakeModel> get shops => _shops;

  void getParsed() async {
    String jsonString = await rootBundle.loadString('assets/fakeData.json');
    final JsonResponse = json.decode(jsonString);
    final List<FakeModel> parsedResponse =
        JsonResponse.map<FakeModel>((json) => FakeModel.fromJson(json))
            .toList();
    debugPrint(parsedResponse[0].desc!.hash);
    _shops = parsedResponse;
    notifyListeners();
  }
}
