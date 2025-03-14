import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:moviepedia/utils/routes/routeNames.dart';
import 'package:moviepedia/utils/utils.dart';
import 'package:moviepedia/view%20model/SessionController/session_controller.dart';


class SignupService with ChangeNotifier{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _loading=false;
  bool get loading=> _loading;
  setLoading(bool value){
    _loading=value;
    notifyListeners();
  }
  final FirebaseDatabase _ref=FirebaseDatabase.instance;
  Future<void> signup(BuildContext context,String email, String password,String userName) async {
    setLoading(true);
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ).then((value){

        Utils.toastMessage("User signed up");
        SessionController().userID=value.user!.uid.toString();
        Navigator.pushReplacementNamed(context,RouteName.navigationScreen);
_ref.ref('users').child(value.user!.uid).set({
  'uid':value.user!.uid,
  'email':email,
}).then((value){
  setLoading(false);
}).onError((error,stacktrace){
 Utils.toastMessage(error.toString());
setLoading(false);
});
      });
      } catch (e) {
      Utils.toastMessage(e.toString());
      setLoading(false);
    }
  setLoading(false);
  }
}
