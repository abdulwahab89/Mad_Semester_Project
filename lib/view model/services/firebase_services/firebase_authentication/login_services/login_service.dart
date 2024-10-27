
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:moviepedia/utils/routes/routeNames.dart';
import 'package:moviepedia/utils/utils.dart';

import '../../../../SessionController/session_controller.dart';
class LoginService with ChangeNotifier{
  bool _loading=false;
  bool get loading=> _loading;
  setLoading(bool value){
    _loading=value;
    notifyListeners();
  }
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
 loginService(BuildContext context,String email, String password) async{
  setLoading(true);
  await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password).then((value){
    SessionController().userID=value.user!.uid;
    setLoading(false);
    Navigator.pushReplacementNamed(context,RouteName.homeScreen);

    if (kDebugMode) {
      print("user login success");
    }
  }).onError((error,stacktrace){
    setLoading(false);
    Utils.toastMessage(error.toString());
  });}
logOutService(BuildContext context) async{
   await _firebaseAuth.signOut().then((value){
     SessionController().userID=null;
     Navigator.pushReplacementNamed(context, RouteName.loginScreen);
   print("logged out");
   }).onError((error,stacktrace){

   });
}
}
