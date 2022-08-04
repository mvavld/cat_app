import 'package:json_annotation/json_annotation.dart';

part 'breed_image.g.dart';

@JsonSerializable()
class BreedImage {
  BreedImage({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
  });

  factory BreedImage.fromJson(Map<String, dynamic> json) =>
      _$BreedImageFromJson(json);

  String id;
  int width;
  int height;
  String url;

  Map<String, dynamic> toJson() => _$BreedImageToJson(this);
}
