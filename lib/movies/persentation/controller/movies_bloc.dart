import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/base_usecase.dart';
import 'package:movies/core/utils/di.dart';
import 'package:movies/core/utils/request_state.dart';
import 'package:movies/movies/domain/usecase/get_now_playing_movies.dart';
import 'package:movies/movies/domain/usecase/get_popular_movies.dart';
import 'package:movies/movies/domain/usecase/get_top_rated_movies.dart';
import 'package:movies/movies/persentation/controller/movies_event.dart';
import 'package:movies/movies/persentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPLayingMoviesUseCase getNowPLayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  MoviesBloc(this.getNowPLayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingEvent);

    on<GetPopularMoviesEvent>(_getPopularEvent);

    on<GetTopRatedMoviesEvent>(_getTopRatedEvent);
  }

  FutureOr<void> _getNowPlayingEvent(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    (await getNowPLayingMoviesUseCase.execute(nullVoid)).fold((l) {
      print(l.message);
      emit(state.copWith(
          nowPlayingState: RequestState.error, nowPlayingMessage: l.message));
    }, (r) {
      emit(state.copWith(
          nowPlayingState: RequestState.loaded, nowPlayingMovies: r));
    });
  }

  FutureOr<void> _getPopularEvent(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    (await getPopularMoviesUseCase.execute(nullVoid)).fold((l) {
      print(l.message);
      emit(state.copWith(
          popularState: RequestState.error, popularMessage: l.message));
    }, (r) {
      emit(state.copWith(
          popularState: RequestState.loaded, popularMovies: r));
    });
  }

  FutureOr<void> _getTopRatedEvent(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    (await getTopRatedMoviesUseCase.execute(nullVoid)).fold((l) {
      print(l.message);
      emit(state.copWith(
          topRatedState: RequestState.error, topRatedMessage: l.message));
    }, (r) {
      emit(state.copWith(
          topRatedState: RequestState.loaded, topRatedMovies: r));
    });
  }
}
