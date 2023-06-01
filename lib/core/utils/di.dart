import 'package:get_it/get_it.dart';
import 'package:movies/movies/data/datasource/movies_remote_data_source.dart';
import 'package:movies/movies/data/repository/movies_repository.dart';
import 'package:movies/movies/domain/repository/base_movies_repository.dart';
import 'package:movies/movies/domain/usecase/get_now_playing_movies.dart';
import 'package:movies/movies/persentation/controller/movies_bloc.dart';

final instance = GetIt.instance ;

initApp(){
  instance.registerLazySingleton<BaseMoviesRemoteDataSource>(() => MoviesRemoteDataSource()) ;
  instance.registerLazySingleton<BaseMoviesRepository>(() => MoviesRepository(instance())) ;
  instance.registerLazySingleton<GetNowPLayingMoviesUseCase>(() => GetNowPLayingMoviesUseCase(instance())) ;
  instance.registerFactory<MoviesBloc>(() => MoviesBloc(instance())) ;
}