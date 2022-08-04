import 'package:cat_app/entities/breed_image_entity.dart';
import 'package:cat_app/entities/network/breed.dart';

class BreedEntity {
  BreedEntity({
    required this.id,
    required this.name,
    this.origin,
    this.description,
    this.image,
    this.wikipediaUrl,
  });

  factory BreedEntity.fromResponse(Breed response) => BreedEntity(
        id: response.id,
        name: response.name,
        origin: response.origin,
        description: response.description,
        wikipediaUrl: response.wikipediaUrl,
        image: response.image != null
            ? BreedImageEntity.fromResponse(response.image!)
            : null,
      );

  String id;
  String name;
  String? origin;
  String? description;
  String? wikipediaUrl;
  BreedImageEntity? image;
}
