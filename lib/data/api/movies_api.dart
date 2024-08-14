import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_flutter/data/model/PopularMovies.dart';


class MoviesApi {
  PopularMovies popularMovies = PopularMovies();
  String error = '';

  fetchMovies() async {
    final response = await http
        .get(Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=426bff346dfb35a5c824f8c3acddcc15'));

    if (response.statusCode == 200) {
      popularMovies = PopularMovies.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      error = response.statusCode.toString();
      popularMovies = PopularMovies();
      throw Exception('Failed to load album');
    }
  }
}