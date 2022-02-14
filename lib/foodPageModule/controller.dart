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
