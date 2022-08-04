import 'package:cat_app/entities/network/breed_image.dart';

class BreedImageEntity {
  BreedImageEntity({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
  });

  factory BreedImageEntity.fromResponse(BreedImage response) =>
      BreedImageEntity(
        id: response.id,
        width: response.width,
        height: response.height,
        url: response.url,
      );

  String id;
  int width;
  int height;
  String url;
}
