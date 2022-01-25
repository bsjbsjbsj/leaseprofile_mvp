import 'package:flutter/cupertino.dart';

class FoodCalculatingProvider with ChangeNotifier {
  int carbonhydrateTotal = 0;
  int proteinTotal = 0;
  int provinceTotal = 0;
  int vitaminTotal = 0;

  void carbonhydrateIncrement(int _carbonhydrate) {
    carbonhydrateTotal = carbonhydrateTotal + _carbonhydrate;
    notifyListeners();
  }

  void carbonhydrateSubtract(int _carbonhydrate) {
    carbonhydrateTotal = carbonhydrateTotal - _carbonhydrate;
    notifyListeners();
  }

  void proteinIncrement(int _protein) {
    proteinTotal = proteinTotal + _protein;
    notifyListeners();
  }

  void proteinSubtract(int _protein) {
    proteinTotal = proteinTotal - _protein;
    notifyListeners();
  }

  void provinceIncrement(int _province) {
    provinceTotal = provinceTotal + _province;
    notifyListeners();
  }

  void provinceSubtract(int _province) {
    provinceTotal = provinceTotal - _province;
    notifyListeners();
  }

  void vitaminIncrement(int _vitamin) {
    vitaminTotal = vitaminTotal + _vitamin;
    notifyListeners();
  }

  void vitaminSubtract(int _vitamin) {
    vitaminTotal = vitaminTotal - _vitamin;
    notifyListeners();
  }
}
