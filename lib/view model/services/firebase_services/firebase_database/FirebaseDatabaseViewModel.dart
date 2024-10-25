import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moviepedia/Model/Firebase_database_model/Database_Model.dart';

import '../../../../utils/utils.dart';


class FirebaseDatabaseViewModel with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  final DatabaseReference database = FirebaseDatabase.instance.ref();

  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
  FirebaseDatabaseViewModel(){
    fetchMovies();
  }
  Map<String, List<DatabaseModel>> moviesByCategory = {};
  DatabaseReference ref = FirebaseDatabase.instance.ref('movies');

  Future<Map<String, List<DatabaseModel>>> fetchMovies() async {
    final snapshot = await ref.get();

    if (snapshot.exists) {

      Map<dynamic, dynamic> data = snapshot.value as Map<dynamic, dynamic>;
      data.forEach((category, movies) {
        List<DatabaseModel> movieList = [];
        Map<dynamic, dynamic> moviesMap = movies as Map<dynamic, dynamic>;

        moviesMap.forEach((key, movieData) {
          movieList.add(DatabaseModel.fromMap(movieData));
        });

        moviesByCategory[category] = movieList;
      });
      return moviesByCategory;
    } else {
      throw Exception("No data available");
    }
  }
  Stream<Map<String, List<DatabaseModel>>> getMoviesStream() {
    return ref.onValue.map((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data == null) return {}; // Return empty if there's no data

      Map<String, List<DatabaseModel>> moviesByCategory = {};
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
      await database.child('movies').child(category.name).push().set(movie.toJson());
      print('Movie added successfully under category: $category');

    } catch (error) {

      print('Failed to add movie: $error');

    }finally{
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
}

