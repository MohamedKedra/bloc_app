import 'movie_api_provider.dart';
import '../models/movie_response.dart';

class Repository{

  MovieApiProvider provider = new MovieApiProvider();

  Future<MovieResponse> fetchAllMovies() => provider.fetchMovieList();
}