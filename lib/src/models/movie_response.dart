import 'movie.dart';

class MovieResponse{

  int _page;
  int _total_pages;
  int _total_results;
  List<Movie> movies = [];

  MovieResponse.fromJson(Map<String,dynamic> parsedJson){

    _page = parsedJson['page'];
    _total_results = parsedJson['total_results'];
    _total_pages = parsedJson['total_pages'];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      Movie _movie = Movie(parsedJson['results'][i]);
      movies.add(_movie);
    }
  }

  int get total_results => _total_results;

  int get total_pages => _total_pages;

  int get page => _page;
}