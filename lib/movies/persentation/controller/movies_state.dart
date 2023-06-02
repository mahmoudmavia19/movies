import 'package:equatable/equatable.dart';
import 'package:movies/core/utils/request_state.dart';

import '../../domain/entities/movies.dart';

 class MoviesState extends Equatable {
  final List<Movies>? nowPlayingMovies ;
  final RequestState? nowPlayingState ;
  final String?       nowPlayingMessage ;
  final List<Movies>? popularMovies ;
  final RequestState? popularState ;
  final String?       popularMessage ;
  final List<Movies>? topRatedMovies ;
  final RequestState? topRatedState ;
  final String?       topRatedMessage ;

 const MoviesState(
     {
       this.nowPlayingMovies = const[],
       this.nowPlayingState = RequestState.loading,
       this.nowPlayingMessage= '' ,
       this.popularMovies = const[],
       this.popularState = RequestState.loading,
       this.popularMessage= '' ,
       this.topRatedMovies = const[],
       this.topRatedState = RequestState.loading,
       this.topRatedMessage= '' ,

     });

  MoviesState copWith({
    List<Movies>? nowPlayingMovies ,
    RequestState? nowPlayingState ,
    String?       nowPlayingMessage ,
    List<Movies>? popularMovies ,
    RequestState? popularState,
    String?       popularMessage ,
    List<Movies>? topRatedMovies,
    RequestState? topRatedState ,
    String?       topRatedMessage ,
 })
  {
    return MoviesState(
        nowPlayingMovies: nowPlayingMovies??this.nowPlayingMovies ,
      nowPlayingState: nowPlayingState??this.nowPlayingState ,
      nowPlayingMessage: nowPlayingMessage??this.nowPlayingMessage ,
      popularMovies: popularMovies??this.popularMovies ,
      popularState: popularState??this.popularState ,
      popularMessage: popularMessage??this.popularMessage ,
      topRatedMovies: topRatedMovies??this.topRatedMovies ,
      topRatedState: topRatedState??this.topRatedState ,
      topRatedMessage: topRatedMessage??this.topRatedMessage ,
    ) ;
  }


@override
   List<Object?> get props =>[
     nowPlayingMovies,nowPlayingState,nowPlayingMessage ,
topRatedState, topRatedMovies,topRatedMessage ,
popularState ,
popularMovies ,
 popularMessage];
}

