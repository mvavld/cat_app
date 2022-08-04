import 'package:cat_app/core/failures.dart';
import 'package:cat_app/core/network/network_info.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

class BaseRepository {
  BaseRepository(this.networkInfo);
  final NetworkInfo networkInfo;

  Future<Either<M, Failure>> sendRequest<M>(
      Future<HttpResponse<M>> request) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await request;

        if (result.response.statusCode.toString().startsWith('2')) {
          return Left(result.data);
        } else {
          return Right(
            Failure.request(
              code: result.response.statusCode,
              message: result.response.statusMessage,
              //errorBody: ErrorBody.fromJson(result.response?.data),
            ),
          );
        }
      } on DioError catch (error) {
        return Right(Failure.request(
          code: error.response?.statusCode,
          message: error.response?.statusMessage,
          // errorBody: ErrorBody.fromJson(error.response?.data),
        ));
      } on Exception catch (error) {
        return Right(Failure.undefined(error: error));
      }
    } else {
      return Right(Failure.network());
    }
  }
}
