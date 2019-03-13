import 'package:flutter/material.dart';

import '../blocs/movies_bloc.dart';
import '../models/movie.dart';
import '../models/movie_response.dart';
import 'movie_detail.dart';

class MovieList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MovieListState();
}

class MovieListState extends State<MovieList> {
  final bloc = MoviesBloc();

  @override
  void initState() {
    super.initState();
    bloc.fetchAllMovies();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body: StreamBuilder(
        stream: bloc.allMovies,
        builder: (context,snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(snapshot) {
    List<Movie> movies = snapshot.data.movies;
    return GridView.builder(
        itemCount: movies.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
            child: InkResponse(
              enableFeedback: true,
              child: Image.network(
                'https://image.tmdb.org/t/p/w185${movies[index].poster_path}',
                fit: BoxFit.cover,
              ),
              onTap: () => openDetailPage(movies, index),
            ),
          );
        });
  }

  openDetailPage(List<Movie> movies, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return MovieDetail(
          title: movies[index].title,
          posterUrl: movies[index].backdrop_path,
          description: movies[index].overview,
          releaseDate: movies[index].release_date,
          voteAverage: movies[index].vote_average.toString(),
          movieId: movies[index].id,
        );
      }),
    );
  }
}
