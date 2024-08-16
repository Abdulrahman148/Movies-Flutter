import 'package:flutter/material.dart';
import 'package:movies_flutter/data/api/movies_api.dart';
import 'package:movies_flutter/presentation/screens/movie_details_screen.dart';
import 'package:movies_flutter/presentation/screens/movies_screen.dart';
import 'package:provider/provider.dart';
import 'constants/strings.dart';

class MoviesRouter {
  Route? generateRoute(RouteSettings settengs) {
    switch (settengs.name) {
      case popularMoviesScreen:
        return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider(
                  create: (context) => MoviesApi(),
                  child: PopularMoviesScreen(),
                ));

      case movieDetailsScreen:
        return MaterialPageRoute(builder: (_) => MovieDetailsScreen());
    }
  }
}
