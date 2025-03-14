import 'package:flutter/material.dart';
import 'package:moviepedia/view%20model/services/firebase_services/firebase_database/FirebaseDatabaseViewModel.dart';
class FavouriteMovieScreen extends StatefulWidget {
  const FavouriteMovieScreen({super.key});

  @override
  State<FavouriteMovieScreen> createState() => _FavouriteMovieScreenState();
}

class _FavouriteMovieScreenState extends State<FavouriteMovieScreen> {
  FirebaseDatabaseViewModel database=FirebaseDatabaseViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: TextButton(onPressed: database.moveData, child:Text('Migerate data')))
        ],
      ),
    );
  }
}
