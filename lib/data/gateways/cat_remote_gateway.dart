import 'package:cat_app/entities/network/breed.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'cat_remote_gateway.g.dart';

@RestApi()
abstract class CatRemoteGateway {
  factory CatRemoteGateway({required Dio dio, String? baseUrl}) {
    final apiClient = _CatRemoteGateway(dio, baseUrl: baseUrl);
    return apiClient;
  }

  @GET('/breeds')
  Future<HttpResponse<List<Breed>>> getBreeds({
    @Header('x-api-key') required String token,
    @Query('attach_breed') required int attachBreed,
    @Query('page') required int page,
    @Query('limit') required int limit,
  });
}
