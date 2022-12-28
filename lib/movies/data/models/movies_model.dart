import 'package:movies/movies/domain/entities/movies.dart';

class MoviesModel extends Movies {
  const MoviesModel(
      {required super.id,
      required super.title,
      required super.backdropPath,
      required super.genreIds,
      required super.overview,
      required super.voteAverage,
      required super.releaseDate});
  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
      id: json['id'],
      title: json['title'],
      backdropPath: json['backdrop_path'],
      genreIds: json['genreIds'],
      overview: json['overview'],
      voteAverage: json['vote_average'],
      releaseDate: json['release_date']);


}
