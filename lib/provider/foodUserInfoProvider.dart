import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FoodUserInfoProvider with ChangeNotifier {
  int? protein;
  int? carbonhydrate;
  int? province;
  int? vitamin;
  setUser({protein, carbonhydrate, province, vitamin}) async {
    final _prefs = await SharedPreferences.getInstance();
    _prefs.setInt('carbonhydrate', carbonhydrate);
    notifyListeners();
  }

  getUser() async {
    final _prefs = await SharedPreferences.getInstance();
    carbonhydrate = _prefs.getInt('carbonhydrate') ?? 0;
    notifyListeners();
  }

  removeUser() async {
    final _prefs = await SharedPreferences.getInstance();
    _prefs.remove('carbonhydrate');
    notifyListeners();
  }
}
