import 'package:dartz/dartz.dart';
import 'package:movies/movies/domain/repository/base_movies_repository.dart';

import '../../../core/error/failure.dart';
import '../../../core/utils/base_usecase.dart';
import '../entities/movies.dart';

class GetPopularMoviesUseCase implements BaseUseCase<void,Either<Failure, List<Movies>>> {
  final BaseMoviesRepository baseMoviesRepository ;

  GetPopularMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movies>>> execute(input) {
    return baseMoviesRepository.getPopularMovies();
  }

}