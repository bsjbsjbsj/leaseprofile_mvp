// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'foodProduct_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodProductModel _$FoodProductModelFromJson(Map<String, dynamic> json) =>
    FoodProductModel(
      product_id: json['product_id'] as int?,
    )
      ..product_name = json['product_name'] as String?
      ..product_seller_name = json['product_seller_name'] as String?
      ..product_description = json['product_description'] as String?
      ..product_carbonhydrate =
          (json['product_carbonhydrate'] as num?)?.toDouble()
      ..product_protein = (json['product_protein'] as num?)?.toDouble()
      ..product_province = (json['product_province'] as num?)?.toDouble()
      ..product_price = json['product_price'] as int?
      ..product_like_count = json['product_like_count'] as int?
      ..product_review_count = json['product_review_count'] as int?;

Map<String, dynamic> _$FoodProductModelToJson(FoodProductModel instance) =>
    <String, dynamic>{
      'product_id': instance.product_id,
      'product_name': instance.product_name,
      'product_seller_name': instance.product_seller_name,
      'product_description': instance.product_description,
      'product_carbonhydrate': instance.product_carbonhydrate,
      'product_protein': instance.product_protein,
      'product_province': instance.product_province,
      'product_price': instance.product_price,
      'product_like_count': instance.product_like_count,
      'product_review_count': instance.product_review_count,
    };
