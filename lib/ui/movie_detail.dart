import 'package:filmophilia/data/movie.dart';
import 'package:flutter/material.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500/';

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: Text(movie.title),
        ),
        body: SingleChildScrollView(
            child: Center(
                child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(16),
                height: height / 1.5,
                child: Image.network(imgPath + movie.posterPath)),
            Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Text(movie.overview),
            )
          ],
        ))));
  }
}
