import 'package:movies/core/utils/base_usecase.dart';
import 'package:movies/movies/domain/entities/movies.dart';
import 'package:movies/movies/domain/repository/base_movies_repository.dart';

class GetNowPLayingMoviesUseCase implements BaseUseCase<void,List<Movies>>{

 final BaseMoviesRepository baseMoviesRepository ;

 GetNowPLayingMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<List<Movies>> execute(input)  async{
   return await baseMoviesRepository.getNowPlaying() ;
  }


}