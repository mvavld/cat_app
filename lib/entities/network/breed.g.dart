// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Breed _$BreedFromJson(Map<String, dynamic> json) => Breed(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] == null
          ? null
          : BreedImage.fromJson(json['image'] as Map<String, dynamic>),
      wikipediaUrl: json['wikipediaUrl'] as String?,
      origin: json['origin'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$BreedToJson(Breed instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'origin': instance.origin,
      'description': instance.description,
      'wikipediaUrl': instance.wikipediaUrl,
      'image': instance.image,
    };
