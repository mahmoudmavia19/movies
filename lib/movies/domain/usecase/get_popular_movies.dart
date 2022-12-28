import 'package:movies/movies/domain/repository/base_movies_repository.dart';

import '../../../core/utils/base_usecase.dart';
import '../entities/movies.dart';

class GetPopularMoviesUseCase implements BaseUseCase<void,List<Movies>> {
  final BaseMoviesRepository baseMoviesRepository ;

  GetPopularMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<List<Movies>> execute(input) {
    return baseMoviesRepository.getPopularMovies();
  }

}