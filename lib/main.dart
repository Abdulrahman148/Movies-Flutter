import 'package:flutter/material.dart';
import 'package:movies_flutter/movies_router.dart';

void main() {
  runApp(MoviesApp(moviesRouter: MoviesRouter()));
}

class MoviesApp extends StatelessWidget {
  final MoviesRouter moviesRouter;

  const MoviesApp({super.key, required this.moviesRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: moviesRouter.generateRoute,
    );
  }
}

