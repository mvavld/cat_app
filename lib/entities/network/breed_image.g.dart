// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breed_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreedImage _$BreedImageFromJson(Map<String, dynamic> json) => BreedImage(
      id: json['id'] as String,
      width: json['width'] as int,
      height: json['height'] as int,
      url: json['url'] as String,
    );

Map<String, dynamic> _$BreedImageToJson(BreedImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
    };
