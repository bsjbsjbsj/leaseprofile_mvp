import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FoodUserInfoProvider with ChangeNotifier {
  int? userProtein;
  int? userCarbonhydrate;
  int? userProvince;
  int? userVitamin;
  setUser({userProtein, userCarbonhydrate, userProvince, userVitamin}) async {
    final _prefs = await SharedPreferences.getInstance();
    _prefs.setInt('carbonhydrate', userCarbonhydrate);
    _prefs.setInt('protein', userProtein);
    _prefs.setInt('province', userProvince);
    _prefs.setInt('vitamin', userVitamin);
    notifyListeners();
  }

  getUser() async {
    final _prefs = await SharedPreferences.getInstance();
    userCarbonhydrate = _prefs.getInt('carbonhydrate');
    userProtein = _prefs.getInt('protein');
    userProvince = _prefs.getInt('province');
    userVitamin = _prefs.getInt('vitamin');
    notifyListeners();
  }

  removeUser() async {
    final _prefs = await SharedPreferences.getInstance();
    _prefs.remove('carbonhydrate');
    _prefs.remove('protein');
    _prefs.remove('province');
    _prefs.remove('vitamin');
    notifyListeners();
  }
}
