import 'package:equatable/equatable.dart';
import 'package:movies/core/utils/request_state.dart';

import '../../domain/entities/movies.dart';

class MoviesState extends Equatable {
  final List<Movies> nowPlayingMovies ;
  final RequestState nowPlayingState ;
  final String nowPlayingMessage ;

 const MoviesState(
     {this.nowPlayingMovies = const[],
       this.nowPlayingState = RequestState.loading,
       this.nowPlayingMessage= ''});

  @override
   List<Object?> get props =>[nowPlayingMovies,nowPlayingState,nowPlayingMessage];
}