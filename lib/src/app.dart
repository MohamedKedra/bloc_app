import 'package:flutter/material.dart';
import '../src/ui/movie_list.dart';

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Bloc Demo",
      theme: ThemeData.dark(),
      home: new Scaffold(
        body: new MovieList(),
      ),
    );
  }
}