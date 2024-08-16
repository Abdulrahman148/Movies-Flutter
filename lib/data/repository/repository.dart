/*
import 'package:flutter/material.dart';
import 'package:movies_flutter/data/api/movies_api.dart';
import 'package:movies_flutter/data/model/PopularMovies.dart';

class Repository extends ChangeNotifier {
  MoviesApi moviesApi = MoviesApi();
  PopularMovies popularMovies = PopularMovies();
  String error = '';

  fetchMovies() {
    moviesApi.fetchMovies();
    popularMovies = moviesApi.popularMovies;
    error = moviesApi.error;
    notifyListeners();
  }
}*/
