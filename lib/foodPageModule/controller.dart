import 'package:flutter_leaseprofile/foodPageModule/model/foodProduct_model.dart';
import 'package:flutter_leaseprofile/foodPageModule/repository/foodproduct_repository.dart';
import 'package:get/get.dart';

class FoodPageController extends GetxController {
  final FoodProductRepository repository = FoodProductRepository();

  RxList<FoodProductModel> _productList = <FoodProductModel>[].obs;
  RxList<FoodProductModel> get productList => this._productList;
  set productList(value) => this._productList = value;
  getAll() {
    repository.getAll().then((data) {
      this._productList.value = data;
      print(productList[0].product_description);
    });
  }
}

class FoodCalculatingController extends GetxController {
  RxDouble carbonhydrateTotal = 0.0.obs;
  RxDouble proteinTotal = 0.0.obs;
  RxDouble provinceTotal = 0.0.obs;

  void carbonhydrateIncrement(double _carbonhydrate) {
    carbonhydrateTotal.value + _carbonhydrate;
  }

  void carbonhydrateSubtract(double _carbonhydrate) {
    carbonhydrateTotal.value - _carbonhydrate;
  }

  void proteinIncrement(double _protein) {
    proteinTotal.value + _protein;
  }

  void proteinSubtract(double _protein) {
    proteinTotal.value - _protein;
  }

  void provinceIncrement(double _province) {
    provinceTotal.value + _province;
  }

  void provinceSubtract(double _province) {
    provinceTotal.value - _province;
  }
}
