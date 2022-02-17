import 'package:json_annotation/json_annotation.dart';
part 'foodProduct_model.g.dart';

@JsonSerializable()
class FoodProductModel {
  int? product_id;
  String? product_name;
  String? product_seller_name;
  String? product_description;
  double? product_carbonhydrate;
  double? product_protein;
  double? product_province;
  int? product_price;
  int? product_like_count;
  int? product_review_count;
  bool? product_ischecked;

  FoodProductModel({this.product_id});

  factory FoodProductModel.fromJson(Map<String, dynamic> json) =>
      _$FoodProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$FoodProductModelToJson(this);
}
