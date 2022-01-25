import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FoodUserInfoProvider with ChangeNotifier {
  int? userCarbonhydrate;
  int? userProtein;
  int? userProvince;
  int? userVitamin;
  setUserCarbonhydrate({userCarbonhydrate}) async {
    final _prefs = await SharedPreferences.getInstance();
    _prefs.setInt('carbonhydrate', userCarbonhydrate);
    notifyListeners();
  }

  setUserProtein({userProtein}) async {
    final _prefs = await SharedPreferences.getInstance();
    _prefs.setInt('protein', userProtein);
    notifyListeners();
  }

  setUserProvince({userProvince}) async {
    final _prefs = await SharedPreferences.getInstance();
    _prefs.setInt('province', userProvince);
    notifyListeners();
  }

  setUserVitamin({userVitamin}) async {
    final _prefs = await SharedPreferences.getInstance();
    _prefs.setInt('vitamin', userVitamin);
    notifyListeners();
  }

  getUserCarbonhydrate() async {
    final _prefs = await SharedPreferences.getInstance();
    userCarbonhydrate = _prefs.getInt('carbonhydrate');
    notifyListeners();
  }

  getUserProtein() async {
    final _prefs = await SharedPreferences.getInstance();
    userProtein = _prefs.getInt('protein');
    notifyListeners();
  }

  getUserProvince() async {
    final _prefs = await SharedPreferences.getInstance();
    userProvince = _prefs.getInt('province');
    notifyListeners();
  }

  getUserVitamin() async {
    final _prefs = await SharedPreferences.getInstance();
    userVitamin = _prefs.getInt('vitamin');
    notifyListeners();
  }

  removeUserCarbonhydrate() async {
    final _prefs = await SharedPreferences.getInstance();
    _prefs.remove('carbonhydrate');
    notifyListeners();
  }

  removeUserProtein() async {
    final _prefs = await SharedPreferences.getInstance();
    _prefs.remove('protein');
    notifyListeners();
  }

  removeUserProvince() async {
    final _prefs = await SharedPreferences.getInstance();
    _prefs.remove('province');
    notifyListeners();
  }

  removeUserVitamin() async {
    final _prefs = await SharedPreferences.getInstance();
    _prefs.remove('vitamin');
    notifyListeners();
  }
}
