import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:moviepedia/view%20model/SessionController/session_controller.dart';
import 'package:moviepedia/view/routes/routeNames.dart';


class SignupService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseDatabase _ref=FirebaseDatabase.instance;
  Future<void> signup(BuildContext context,String email, String password,String phoneNo,String userName) async {
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
  'phno':phoneNo,
  'userName':phoneNo,
}).then((value){
  print("Data stored sucessfully");
}).onError((error,stacktrace){
  print(error.toString());
});
      });
      print('User signed up successfully');
      // You might want to return some meaningful result or signal success
    } catch (e) {
      // Handle FirebaseAuthException
      if (e is FirebaseAuthException) {
        print('Firebase Auth Exception:');
        print('Code: ${e.code}');
        print('Message: ${e.message}');
        // Handle specific error cases like 'weak-password', 'email-already-in-use'
        // You can also throw the exception again to propagate it up if needed
        rethrow;
      } else {
        // Handle other exceptions
        print('Error occurred while signing up: $e');
        rethrow;
      }
    }
  }
}
