// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'foodPostModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodPostModel _$FoodPostModelFromJson(Map<String, dynamic> json) =>
    FoodPostModel(
      id: json['id'] as int?,
      isChecked: json['isChecked'] as bool?,
      shopName: json['shopName'] as String?,
      images: json['images'] == null
          ? null
          : Images.fromJson(json['images'] as Map<String, dynamic>),
      desc: json['desc'] == null
          ? null
          : Desc.fromJson(json['desc'] as Map<String, dynamic>),
      option: json['option'] == null
          ? null
          : Option.fromJson(json['option'] as Map<String, dynamic>),
      price: json['price'] == null
          ? null
          : Price.fromJson(json['price'] as Map<String, dynamic>),
      nutrients: json['nutrients'] == null
          ? null
          : Nutrients.fromJson(json['nutrients'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FoodPostModelToJson(FoodPostModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isChecked': instance.isChecked,
      'shopName': instance.shopName,
      'images': instance.images,
      'desc': instance.desc,
      'option': instance.option,
      'price': instance.price,
      'nutrients': instance.nutrients,
    };

Images _$ImagesFromJson(Map<String, dynamic> json) => Images(
      mainImage: json['mainImage'] as String?,
    );

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'mainImage': instance.mainImage,
    };

Desc _$DescFromJson(Map<String, dynamic> json) => Desc(
      hash: json['hash'] as String?,
      detail: json['detail'] as String?,
    );

Map<String, dynamic> _$DescToJson(Desc instance) => <String, dynamic>{
      'hash': instance.hash,
      'detail': instance.detail,
    };

Option _$OptionFromJson(Map<String, dynamic> json) => Option(
      s1: json['s1'] as String?,
      s2: json['s2'] as String?,
    );

Map<String, dynamic> _$OptionToJson(Option instance) => <String, dynamic>{
      's1': instance.s1,
      's2': instance.s2,
    };

Price _$PriceFromJson(Map<String, dynamic> json) => Price(
      p1: json['p1'] as String?,
      p2: json['p2'] as String?,
    );

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
      'p1': instance.p1,
      'p2': instance.p2,
    };

Nutrients _$NutrientsFromJson(Map<String, dynamic> json) => Nutrients(
      carbonhydrate: json['carbonhydrate'] as String?,
      protein: json['protein'] as String?,
      province: json['province'] as String?,
      vitamin: json['vitamin'] as String?,
    );

Map<String, dynamic> _$NutrientsToJson(Nutrients instance) => <String, dynamic>{
      'carbonhydrate': instance.carbonhydrate,
      'protein': instance.protein,
      'province': instance.province,
      'vitamin': instance.vitamin,
    };
