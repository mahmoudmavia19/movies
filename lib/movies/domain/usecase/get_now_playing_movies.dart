import 'package:dartz/dartz.dart';
import 'package:movies/core/utils/base_usecase.dart';
import 'package:movies/movies/domain/entities/movies.dart';
import 'package:movies/movies/domain/repository/base_movies_repository.dart';

import '../../../core/error/failure.dart';

class GetNowPLayingMoviesUseCase implements BaseUseCase<void,Either<Failure, List<Movies>>>{

 final BaseMoviesRepository baseMoviesRepository ;

 GetNowPLayingMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movies>>> execute(input)  async{
   return await baseMoviesRepository.getNowPlayingMovies() ;
  }


}