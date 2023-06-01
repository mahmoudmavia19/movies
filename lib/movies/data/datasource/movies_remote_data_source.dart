import 'package:dio/dio.dart';
import 'package:movies/core/error/exception.dart';
import 'package:movies/core/network/api_constance.dart';
import 'package:movies/core/network/error_message_model.dart';
import 'package:movies/core/utils/app_constance.dart';
import 'package:movies/movies/data/models/movies_model.dart';


abstract class BaseMoviesRemoteDataSource {
  Future<List<MoviesModel>> getNowPlayingMovies();
  Future<List<MoviesModel>> getNowPopularMovies();
  Future<List<MoviesModel>> getNowTopRatedMovies();
}
class MoviesRemoteDataSource extends BaseMoviesRemoteDataSource{
  @override
  Future<List<MoviesModel>> getNowPlayingMovies()async{
    var response = await Dio().get(ApiConstance.nowPlaying);
    if(response.statusCode == ApiConstance.success)
      {
        return List<MoviesModel>.from((response.data[EndPoints.results] as List)
            .map((e) => MoviesModel.fromJson(e)));
      }
    else
      {
        throw ServerException(
          errorMessageModel:  ErrorMessageModel.fromJson(response.data)
        );
      }
  }

  @override
  Future<List<MoviesModel>> getNowPopularMovies() async {
    final response = await Dio().get(ApiConstance.popularMoviesPath);

    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data["results"] as List).map(
            (e) => MoviesModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MoviesModel>> getNowTopRatedMovies() async {
    final response = await Dio().get(ApiConstance.topRatedMoviesPath);

    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data["results"] as List).map(
            (e) => MoviesModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}