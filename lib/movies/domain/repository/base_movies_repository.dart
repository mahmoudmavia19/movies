import 'package:movies/movies/domain/entities/movies.dart';

abstract class BaseMoviesRepository {

  Future<List<Movies>> getNowPlaying();

  Future<List<Movies>> getPopularMovies();

  Future<List<Movies>> getTopRatedMovies();

}