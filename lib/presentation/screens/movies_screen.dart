import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_flutter/constants/colors.dart';
import 'package:movies_flutter/data/api/movies_api.dart';
import 'package:movies_flutter/data/model/PopularMovies.dart';
import 'package:movies_flutter/presentation/widgets/popular_movie_item.dart';
import 'package:provider/provider.dart';

class PopularMoviesScreen extends StatefulWidget {
  const PopularMoviesScreen({super.key});

  @override
  State<PopularMoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<PopularMoviesScreen> {
  int _selectedIndex = 0;
  static MoviesApi moviesApi = MoviesApi();
  static List<Results>? popularResults = moviesApi.popularMovies.results;
  static List<Results>? topRatedResults = moviesApi.topRatedMovies.results;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    moviesApi = Provider.of<MoviesApi>(context);
    moviesApi.fetchPopularMovies();
    moviesApi.fetchTopRatedMovies();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _colorOptions.elementAt(_selectedIndex),
        leading: Icon(
          _iconOptions.elementAt(_selectedIndex),
          color: Colors.white,
        ),
        title: Text(
          _textOptions.elementAt(_selectedIndex),
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
          child: moviesApi.popularMovies.results == null
              ? getLoadingUI()
              : _widgetOptions.elementAt(_selectedIndex),),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.stars_rounded,
            ),
            label: 'Popular',
            backgroundColor: MyColors.myRed,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline_rounded),
            label: 'Now Playing',
            backgroundColor: MyColors.myGreen,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_circle_up_rounded),
            label: 'Top Rated',
            backgroundColor: MyColors.myBlue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Search',
            backgroundColor: MyColors.myPurple,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: MyColors.selectedColor,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget getLoadingUI() {
    return Center(
      child: CircularProgressIndicator(
        color: _colorOptions.elementAt(_selectedIndex),
      ),
    );
  }

  Widget getErrorUI(error) {
    return Center(
      child: Text(error),
    );
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  static Widget getBodyUI(List<Results>? results) {
    return ListView.builder(
        itemCount: results?.length,
        itemBuilder: (context, index) {
          return PopularMovieItem(result: results![index]);
        });
  }

  static final List<Widget> _widgetOptions = <Widget>[
    getBodyUI(popularResults),
    Text(
      'Index 2: Top Rated soon ...',
      style: optionStyle,
    ),
    getBodyUI(topRatedResults),
    Text(
      'Index 3: Search soon ...',
      style: optionStyle,
    ),
  ];

  static final List<Color> _colorOptions = <Color>[
    MyColors.myRed,
    MyColors.myGreen,
    MyColors.myBlue,
    MyColors.myPurple,
  ];

  static final List<String> _textOptions = <String>[
    'Popular Movies',
    'Now Playing Movies',
    'Top Rated Movies',
    'Search',
  ];

  static final List<IconData> _iconOptions = <IconData>[
    Icons.stars_rounded,
    Icons.play_circle_outline_rounded,
    Icons.arrow_circle_up_rounded,
    Icons.search_rounded,
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
