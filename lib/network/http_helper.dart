import 'dart:convert';
import 'dart:io';
import 'package:filmophilia/data/movie.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

class HttpHelper {
  final String urlBase = 'https://api.themoviedb.org/3';
  final String urlUpcoming = '/movie/upcoming';
  final String urlSearchBase = '/search/movie';

  Future<List> getRecentUpdate() async {
    await DotEnv.load(fileName: ".env");
    final String upcoming = urlBase + urlUpcoming + env['API_KEY'];
    http.Response result = await http.get(Uri.parse(upcoming));

    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      return null;
    }
  }

  Future<List> findMovies(String title) async {
    await DotEnv.load(fileName: ".env");
    final String query =
        urlBase + urlSearchBase + env['API_KEY'] + '&query=' + title;
    http.Response result = await http.get(Uri.parse(query));
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      return null;
    }
  }
}
