import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_leaseprofile/model/studioPostModel.dart';

class studioPostProvider with ChangeNotifier {
  List<StudioPostModel> _studioShops = [];
  List<StudioPostModel> get studioShops => _studioShops;

  void getParsed() async {
    String jsonString =
        await rootBundle.loadString('assets/studioPostData.json');
    final JsonResponse = json.decode(jsonString);
    final List<StudioPostModel> parsedResponse =
        JsonResponse.map<StudioPostModel>(
            (json) => StudioPostModel.fromJson(json)).toList();
    debugPrint(parsedResponse[0].desc!.hash);
    _studioShops = parsedResponse;
    notifyListeners();
  }
}
