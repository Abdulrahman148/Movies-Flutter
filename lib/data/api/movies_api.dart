import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_flutter/data/model/PopularMovies.dart';

import '../../constants/strings.dart';

class MoviesApi extends ChangeNotifier {
  PopularMovies popularMovies = PopularMovies();
  PopularMovies topRatedMovies = PopularMovies();
  String error = '';

  fetchPopularMovies() async {
    final response = await http
        .get(Uri.parse('${baseUrl}popular?api_key=426bff346dfb35a5c824f8c3acddcc15'));

    if (response.statusCode == 200) {
      popularMovies = PopularMovies.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      error = response.statusCode.toString();
      throw Exception('Failed to load album');
    }
    notifyListeners();
  }

  fetchTopRatedMovies() async {
    final response = await http
        .get(Uri.parse('${baseUrl}top_rated?api_key=426bff346dfb35a5c824f8c3acddcc15'));

    if (response.statusCode == 200) {
      topRatedMovies = PopularMovies.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      error = response.statusCode.toString();
      throw Exception('Failed to load album');
    }
    notifyListeners();
  }

}