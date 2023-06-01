
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/base_usecase.dart';
import 'package:movies/core/utils/di.dart';
import 'package:movies/core/utils/request_state.dart';
import 'package:movies/movies/domain/usecase/get_now_playing_movies.dart';
import 'package:movies/movies/persentation/controller/movies_event.dart';
import 'package:movies/movies/persentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent,MoviesState> {
  final GetNowPLayingMoviesUseCase getNowPLayingMoviesUseCase ;
  MoviesBloc(this.getNowPLayingMoviesUseCase) : super(const MoviesState()){
    on<GetNowPlayingMoviesEvent>((event, emit) async{
      emit(const MoviesState(nowPlayingState: RequestState.loading,));

      (await getNowPLayingMoviesUseCase.execute(nullVoid)).fold((l) {
       print(l.message) ;
       emit(MoviesState(nowPlayingState: RequestState.error,nowPlayingMessage: l.message));
     }, (r)
     {
       emit(MoviesState(nowPlayingState: RequestState.loaded,nowPlayingMovies: r));
     }
     )  ;


    });
  }

}