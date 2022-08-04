import 'package:cat_app/entities/network/breed_image.dart';
import 'package:json_annotation/json_annotation.dart';

part 'breed.g.dart';

@JsonSerializable()
class Breed {
  Breed({
    required this.id,
    required this.name,
    this.image,
    this.wikipediaUrl,
    this.origin,
    this.description,
  });

  factory Breed.fromJson(Map<String, dynamic> json) {
    return _$BreedFromJson(json);
  }

  String id;
  String name;
  String? origin;
  String? description;
  String? wikipediaUrl;
  BreedImage? image;

  Map<String, dynamic> toJson() {
    return _$BreedToJson(this);
  }
}
