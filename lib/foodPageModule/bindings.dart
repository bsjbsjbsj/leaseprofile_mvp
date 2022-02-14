import 'package:flutter_leaseprofile/foodPageModule/controller.dart';
import 'package:get/get.dart';

class FoodPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      FoodPageController(),
    );
    Get.put(
      FoodPageController(),
    ).getAll();
  }
}
