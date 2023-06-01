class ApiConstance{
  static String basUrl = 'https://api.themoviedb.org/3';
  static String appID = 'ecb6d53e218a1d965cdf65a6ca38c4c8';
  static String nowPlaying = '$basUrl/movie/now_playing?api_key=$appID';
  static   String popularMoviesPath =
      "$basUrl/movie/popular?api_key=$appID";
  static   String topRatedMoviesPath =
      "$basUrl/movie/top_rated?api_key=$appID";
  static int success = 200 ;
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path) => '$baseImageUrl$path';

}