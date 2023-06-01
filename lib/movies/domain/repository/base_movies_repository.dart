import 'package:dartz/dartz.dart';
import 'package:movies/movies/domain/entities/movies.dart';

import '../../../core/error/failure.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movies>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movies>>> getPopularMovies();

  Future<Either<Failure, List<Movies>>> getTopRatedMovies();

}