import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moviepedia/Model/Firebase_database_model/Database_Model.dart';

import '../../../../utils/utils.dart';


class FirebaseDatabaseViewModel with ChangeNotifier {

  final DatabaseReference database = FirebaseDatabase.instance.ref();


  Map<dynamic, List<DatabaseModel>> moviesByCategory = {};
  DatabaseReference ref = FirebaseDatabase.instance.ref('movies');
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<Map<dynamic, List<DatabaseModel>>> getMoviesStream() {
    return ref.onValue.map((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data == null) return {};

      Map<dynamic, List<DatabaseModel>> moviesByCategory = {};
      data.forEach((category, movies) {
        List<DatabaseModel> movieList = [];
        Map<dynamic, dynamic> moviesMap = movies as Map<dynamic, dynamic>;

        moviesMap.forEach((key, movieData) {
          movieList.add(DatabaseModel.fromMap(movieData));
        });

        moviesByCategory[category] = movieList;
      });

      return moviesByCategory;
    });
  }

  Future<void> postData(DatabaseModel movie, MovieCategory category) async {
    try {
      await database.child('movies').child(category.name).child(
          movie.id.toString()).set(movie.toJson());
      print('Movie added successfully under category: $category');
    } catch (error) {
      print('Failed to add movie: $error');
    }
  }

  Future<String?> uploadImageService(XFile? image) async {
    if (image == null) {
      Utils.toastMessage("No image selected");
      return null;
    }

    try {
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('images/${DateTime.now().toString()}');

      await storageRef.putFile(File(image.path));

      final String downloadUrl = await storageRef.getDownloadURL();
      print("Image uploaded successfully. Download URL: $downloadUrl");
      return downloadUrl;
    } catch (e) {
      Utils.toastMessage("Image upload failed: $e");
      return null;
    }
  }

  Future<Map<dynamic, dynamic>> getMoviesDataAll() async {
    final snapshot = await ref.get();
    if (snapshot.exists) {
      final data = snapshot.value as Map<dynamic, dynamic>; // Specify the type of the data
      return data;
    } else {
      throw Exception('No data found in Realtime Database');
    }
  }

  Future<void> moveData() async {
    try {
      // Fetch the data from Realtime Database
      final data = await getMoviesDataAll();

      if (data.containsKey('movies')) {
        final moviesData = data['movies'] as Map<dynamic, dynamic>;

        // Iterate through each category in the movies data
        for (var category in moviesData.keys) {
          final categories = moviesData[category] as Map<dynamic, dynamic>;

          // Create a new Firestore document for each category
          final categoryDoc = await firestore.collection('movies')
              .doc(category)
              .get();

          // If the category document does not exist, create it
          if (!categoryDoc.exists) {
            await firestore.collection('movies').doc(category).set({
              'categoryName': category,
            });
          }

          // Iterate through each movie in the category
          for (var movieId in categories.keys) {
            final movie = categories[movieId] as Map<dynamic, dynamic>;

            // Create or update the movie document in Firestore
            await categoryDoc.reference.collection('MoviesList')
                .doc(movieId)
                .set({
              'category': movie['category'],
              'cover_url': movie['cover_url'],
              'id': movie['id'],
              'imageUrl': movie['imageUrl'],
              'movieName': movie['movieName'],
              'movieReview': movie['movieReview'],
              'movie_description': movie['movie_description'],
              'movie_rating': movie['movie_rating'],
              'movie_year': movie['movie_year'],
            });
          }
        }
      }

      if (data.containsKey('users')) {
        final usersData = data['users'] as Map<dynamic, dynamic>;

        // Iterate through each user and store their data in Firestore
        for (var userId in usersData.keys) {
          final userData = usersData[userId] as Map<dynamic, dynamic>;

          // Add or update user data in Firestore
          await firestore.collection('Users').doc(userId).set({
            'email': userData['email'],
            'uid': userData['uid'],
          });
        }
      }

      print("Data successfully moved to Firestore!");
    } catch (e) {
      print("Error during data migration: $e");
    }
  }

//   Future<void> moveData() async {
//  final data= await getMoviesDataAll();
//   if(data.containsKey('movies')){
//     final moviesData=data['movies'] as Map<dynamic,dynamic>;
//     for(var category in moviesData.keys){
//      final categories= moviesData[category] as Map<dynamic,dynamic>;
// final categoryDoc=await firestore.collection('movies').doc(category);
// for(var movies in categories.keys){
//   final movie=categories[movies] as Map<dynamic,dynamic>;
// await categoryDoc.collection('MoviesList').doc(movies).set({
//   'category': movie['category'],
//   'cover_url': movie['cover_url'],
//   'id': movie['id'],
//   'imageUrl': movie['imageUrl'],
//   'movieName': movie['movieName'],
//   'movieReview': movie['movieReview'],
//   'movie_description': movie['movie_description'],
//   'movie_rating': movie['movie_rating'],
//   'movie_year': movie['movie_year'],
// });
// }
//     }
//   }
//  if (data.containsKey('users')) {
//    final usersData = data['users'] as Map<dynamic, dynamic>;
//
//    for (var userId in usersData.keys) {
//      final userData = usersData[userId] as Map<dynamic, dynamic>;
//
//      await firestore.collection('Users').doc(userId).set({
//        'email': userData['email'],
//        'uid': userData['uid'],
//      });
//    }
//   }
// }}
}
