/*
part of 'popular_movies_cubit.dart';

@immutable
sealed class PopularMoviesState {}

final class PopularMoviesInitial extends PopularMoviesState {}

class PopularMoviesLoaded extends PopularMoviesState{
  final List<Posts> posts;

  PopularMoviesLoaded(this.posts);
}
*/
