import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/movie_response.dart';

class MovieApiProvider{

  Client client = new Client();
  final _apiKey = "d45f4694bfc80e05d2e035bedf5764c9";

  Future<MovieResponse> fetchMovieList() async{

    final response = await client.get("http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey");
    if(response.statusCode == 200){
      return MovieResponse.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to loaded');
    }
  }
}