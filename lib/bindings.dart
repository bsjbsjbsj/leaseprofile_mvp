import 'package:flutter_leaseprofile/foodPageModule/controller.dart';
import 'package:flutter_leaseprofile/inbodyPageModule/inbody.dart';
import 'package:get/get.dart';

class FoodPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      FoodPageController(),
    ).getAll();

    Get.put(
      FoodCalculatingController(),
    );
    Get.put(GetXHttp());
    Get.put(GetXHttp()).connectServer();
  }
}
