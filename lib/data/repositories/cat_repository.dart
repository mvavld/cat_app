import 'package:cat_app/core/failures.dart';
import 'package:cat_app/core/repositories/base_repository.dart';
import 'package:cat_app/data/gateways/cat_remote_gateway.dart';
import 'package:cat_app/entities/breed_entity.dart';
import 'package:dartz/dartz.dart';

class CatRepository extends BaseRepository {
  CatRepository(
    super.networkInfo, {
    required this.catRemoteGateway,
  });

  CatRemoteGateway catRemoteGateway;

  Future<Either<List<BreedEntity>, Failure>> getBreeds({
    required String token,
    required int attachBreed,
    required int page,
    required int limit,
  }) async {
    try {
      final result = await sendRequest(
        catRemoteGateway.getBreeds(
          token: token,
          attachBreed: attachBreed,
          page: page,
          limit: limit,
        ),
      );
      return result.fold(
        (response) => Left(response.map(BreedEntity.fromResponse).toList()),
        Right.new,
      );
    } on Exception catch (e) {
      return Right(Failure.undefined(error: e));
    }
  }
}
