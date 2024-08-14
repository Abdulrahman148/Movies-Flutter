/*
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_flutter/data/repository/movies_repository.dart';

import '../../data/model/PopularMovies.dart';
import '../../data/model/test.dart';

part 'popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  final MoviesRepository moviesRepository;
  List<Posts> posts = [];
  PopularMoviesCubit(this.moviesRepository) : super(PopularMoviesInitial());

  List<Posts> getAllPopularMovies() {
    moviesRepository.getAllPopularMovies().then((posts) {
      emit(PopularMoviesLoaded(posts));
      this.posts = posts;
    });
    return posts;
  }
}
*/
