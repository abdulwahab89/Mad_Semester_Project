import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:moviepedia/view%20model/SessionController/session_controller.dart';
import 'package:moviepedia/view/routes/routeNames.dart';


class SignupService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseDatabase _ref=FirebaseDatabase.instance;
  Future<void> signup(BuildContext context,String email, String password,String userName) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ).then((value){
        SessionController().userID=value.user!.uid.toString();
        Navigator.pushReplacementNamed(context,RouteName.dashboardScreen);
_ref.ref('users').child(value.user!.uid).set({
  'uid':value.user!.uid,
  'email':email,
}).then((value){
  print("Data stored sucessfully");
}).onError((error,stacktrace){
  print(error.toString());
});
      });
      print('User signed up successfully');
      } catch (e) {
      if (e is FirebaseAuthException) {
        print('Firebase Auth Exception:');
        print('Code: ${e.code}');
        print('Message: ${e.message}');
         rethrow;
      } else {
        print('Error occurred while signing up: $e');
        rethrow;
      }
    }
  }
}
