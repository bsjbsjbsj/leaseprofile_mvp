import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
part 'fakeModel.g.dart';

@JsonSerializable()
class FakeModel with ChangeNotifier {
  int? id;
  String? shopName;
  Images? images;
  Desc? desc;
  Option? option;
  Option? price;

  FakeModel(
      {this.id,
      this.shopName,
      this.images,
      this.desc,
      this.option,
      this.price});

  factory FakeModel.fromJson(Map<String, dynamic> json) =>
      _$FakeModelFromJson(json);

  Map<String, dynamic> toJson() => _$FakeModelToJson(this);
}

@JsonSerializable()
class Images {
  String? mainImage;

  Images({this.mainImage});

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesToJson(this);
}

@JsonSerializable()
class Desc {
  String? hash;
  String? detail;

  Desc({this.hash, this.detail});

  factory Desc.fromJson(Map<String, dynamic> json) => _$DescFromJson(json);

  Map<String, dynamic> toJson() => _$DescToJson(this);
}

@JsonSerializable()
class Option {
  String? s1;
  String? s2;

  Option({this.s1, this.s2});

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);

  Map<String, dynamic> toJson() => _$OptionToJson(this);
}