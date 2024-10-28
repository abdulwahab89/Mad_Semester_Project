import 'dart:io';

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
      await database.child('movies').child(category.name).child(movie.id.toString()).set(movie.toJson());
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
}

