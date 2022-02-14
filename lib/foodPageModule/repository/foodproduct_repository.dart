import 'package:flutter_leaseprofile/foodPageModule/provider/foodProduct_api.dart';

class FoodProductRepository {
  final FoodProductApi foodProductApi = FoodProductApi();

//  Entity api 분리하는 곳 ex) 푸드 제품 중 이미지 api는 getImage 해서 분리하면 될 듯
// 일단은 데이터 전부 끌고오는 getAll 넣어 놨음.
  getAll() {
    return foodProductApi.getAll();
  }
}
