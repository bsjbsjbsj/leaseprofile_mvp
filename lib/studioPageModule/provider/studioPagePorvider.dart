import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_leaseprofile/studioPageModule/model/studioPageModel.dart';

class studioPageProvider with ChangeNotifier {
  List<StudioPageModel> _studioShops = [];
  List<StudioPageModel> get studioShops => _studioShops;

  void getParsed() async {
    String jsonString =
        await rootBundle.loadString('assets/studioPostData.json');
    final JsonResponse = json.decode(jsonString);
    final List<StudioPageModel> parsedResponse =
        JsonResponse.map<StudioPageModel>(
            (json) => StudioPageModel.fromJson(json)).toList();
    _studioShops = parsedResponse;
    notifyListeners();
  }
}
