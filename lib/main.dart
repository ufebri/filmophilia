import 'package:filmophilia/ui/movie_list.dart';
import 'package:flutter/material.dart';

void main() => runApp(FilmoPhilia());

class FilmoPhilia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Movies',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MovieList();
  }
}

