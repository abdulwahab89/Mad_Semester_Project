import 'dart:async';
import 'dart:core';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moviepedia/utils/routes/routeNames.dart';
import 'package:moviepedia/view%20model/SessionController/session_controller.dart';
class SplashService{
isLogin(BuildContext context){
  FirebaseAuth auth=FirebaseAuth.instance;
  final user=auth.currentUser;
  if(user!=null){
    SessionController().userID=user.uid.toString();
    Timer(const Duration(
      seconds: 2
    ),()=> Navigator.pushReplacementNamed(context,RouteName.homeScreen)
    );
    }else{
    Timer(const Duration(
        seconds: 2
    ),()=> Navigator.pushReplacementNamed(context,RouteName.loginScreen));
     }
}
}