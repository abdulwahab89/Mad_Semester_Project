import 'package:flutter/material.dart';
import 'package:moviepedia/Model/Firebase_database_model/Database_Model.dart';
import 'package:moviepedia/res/components/category_card.dart';

import '../utils/routes/routeNames.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MovieCategory> categories=MovieCategory.values;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
