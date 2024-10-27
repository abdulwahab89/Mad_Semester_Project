import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moviepedia/utils/utils.dart';
import 'package:moviepedia/view%20model/services/firebase_services/firebase_database/FirebaseDatabaseViewModel.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../Model/Firebase_database_model/Database_Model.dart';

class PostData with ChangeNotifier {
  final ImagePicker picker = ImagePicker();
  XFile? selectedImage;
  bool isLoading = false;
  final FirebaseDatabaseViewModel firebaseDatabaseViewModel = FirebaseDatabaseViewModel();


  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<XFile?> pickImage() async {
    if (!kIsWeb) {
      var status = await Permission.storage.request();
      if (status.isGranted) {
        final image = await picker.pickImage(source: ImageSource.gallery);
        return image;
      } else if (status.isPermanentlyDenied) {
        await openAppSettings();
        Utils.toastMessage("Please enable storage permission in settings.");
      } else {
        Utils.toastMessage("Permission denied");
      }
    } else {
      return await picker.pickImage(source: ImageSource.gallery);
    }
    return null;
  }

  Future<XFile?> selectImage() async {
    try {
      selectedImage = await pickImage();
      notifyListeners();
      return selectedImage;
    } catch (e) {
      Utils.toastMessage("Error picking image: ${e.toString()}");
      return null;
    }
  }

  Future<String?> uploadImageData(XFile? selectedImage) async {
    if (selectedImage == null) {
      Utils.toastMessage("No image selected");
      return null;
    }

    try {
      final FirebaseDatabaseViewModel firebaseDatabaseViewModel = FirebaseDatabaseViewModel();
      final String? imageUrl = await firebaseDatabaseViewModel
          .uploadImageService(selectedImage);
      return imageUrl;
    }on SocketException {
      Utils.toastMessage("No internet connection. Please check your connection and try again.");
    }
    catch (e) {
      Utils.toastMessage("Error uploading image: ${e.toString()}");
      return null;
    }
  }

  Future<void> postUserData(XFile? selectedImage,
      String description,
      String selectedYear,
      String rating,
      String movieName,
      MovieCategory? selectedCategory,BuildContext context) async {
setLoading(true);
    if (selectedCategory == null || selectedYear.isEmpty) {
      Utils.toastMessage(
          "Please select a movie category and specify the year.");
      return;
    }
    try {
      final String? downloadedUrl = await uploadImageData(selectedImage);
      if (downloadedUrl == null) {
        Utils.toastMessage("Image upload failed.");
        return;
      }
      final DatabaseModel movieData = DatabaseModel(
        id: DateTime
            .now()
            .microsecond
            .toString(),
        imageUrl: downloadedUrl,
        cover_url: downloadedUrl,
        description: description,
        movieYear: selectedYear,
        movieRating: rating,
        movieName: movieName,
        movieCategory: selectedCategory,
      );
      await firebaseDatabaseViewModel.postData(movieData, selectedCategory);
Navigator.pop(context);
      Utils.toastMessage("Movie added successfully");
    }on SocketException {
      Utils.toastMessage("No internet connection. Please check your connection and try again.");
    }
    catch (e) {
      Utils.toastMessage("Error adding movie data: ${e.toString()}");
    }

    finally{
      setLoading(false);
    }
  }
}

