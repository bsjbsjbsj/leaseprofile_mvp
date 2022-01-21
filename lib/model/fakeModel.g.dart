// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fakeModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FakeModel _$FakeModelFromJson(Map<String, dynamic> json) => FakeModel(
      id: json['id'] as int?,
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
    );

Map<String, dynamic> _$FakeModelToJson(FakeModel instance) => <String, dynamic>{
      'id': instance.id,
      'shopName': instance.shopName,
      'images': instance.images,
      'desc': instance.desc,
      'option': instance.option,
      'price': instance.price,
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
