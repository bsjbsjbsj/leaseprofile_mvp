import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_leaseprofile/model/postModel.dart';

class PostProvider with ChangeNotifier {
  List<PostModel> _shops = [];
  List<PostModel> get shops => _shops;

  void getParsed() async {
    String jsonString = await rootBundle.loadString('assets/fakeData.json');
    final JsonResponse = json.decode(jsonString);
    final List<PostModel> parsedResponse =
        JsonResponse.map<PostModel>((json) => PostModel.fromJson(json))
            .toList();
    debugPrint(parsedResponse[0].desc!.hash);
    _shops = parsedResponse;
    notifyListeners();
  }
}
