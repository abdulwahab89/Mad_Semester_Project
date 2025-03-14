import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ReviewedMoviesScreen.dart';
import 'add_to_watchlist_screen.dart';
import 'favourite_movie_screen.dart';
import 'home_screen.dart';
class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}
class _NavigationScreenState extends State<NavigationScreen> {
 @override

  int _currentIndex=0;
  final List<Widget> _screens=[
    const HomeScreen(),
    const FavouriteMovieScreen(),
    const AddToWatchlistScreen(),
    const ReviewMovieScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            _currentIndex=index;
          });
        },
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.hand_thumbsup),
            label: 'Liked',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.book),
              label: 'Reviewed'
          ),
          BottomNavigationBarItem(icon: Icon(Icons.movie_creation_outlined),
            label: 'Watch List',
          ),
        ],
      ),
      body: _screens[_currentIndex],
    );
  }
}
