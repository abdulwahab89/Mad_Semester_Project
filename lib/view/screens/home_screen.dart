import 'package:flutter/material.dart';
import 'package:moviepedia/Model/Firebase_database_model/Database_Model.dart';
import 'package:moviepedia/res/components/category_card.dart';
import 'package:moviepedia/view%20model/services/firebase_services/firebase_authentication/login_services/login_service.dart';

import '../../utils/colors.dart';
import '../../utils/routes/routeNames.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MovieCategory> categories=MovieCategory.values;
  final LoginService _loginService = LoginService();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            _loginService.logOutService(context);
          },
          child: const Icon(Icons.exit_to_app_outlined, color: AppColors.secondaryColor),
        ),
        backgroundColor: AppColors.backgroundColor,
        title: const Text('Home Screens',
        style: TextStyle(
          color: Colors.white,
        ),
        ),),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.backgroundColor,
        child: const Icon(Icons.add,
        color: AppColors.secondaryColor,

        ),

        onPressed: ()=> Navigator.pushNamed(context,RouteName.postScreen)),
      body:ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context,value){
        return CategoryCard(
          onPressed: ()=> Navigator.pushNamed(context,RouteName.dashboardScreen,
          arguments: categories[value].name.toString(),
          ),
          imageUrl: "assets/images/${categories[value].name.toString()}.jpg", title: categories[value].name.toString(),
        );
      }),

    );
  }
}
