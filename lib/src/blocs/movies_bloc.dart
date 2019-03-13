import 'package:rxdart/rxdart.dart';
import '../models/movie_response.dart';
import '../resources/movie_api_provider.dart';

class MoviesBloc{

  MovieApiProvider provider = new MovieApiProvider();
  final moviesFetcher = PublishSubject<MovieResponse>();

  Observable<MovieResponse> get allMovies => moviesFetcher.stream;

  fetchAllMovies() async {

    MovieResponse movieResponse = await provider.fetchMovieList();
    moviesFetcher.sink.add(movieResponse);
  }

  dispose() {
    moviesFetcher.close();
  }
}