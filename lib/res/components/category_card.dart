import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CategoryCard extends StatelessWidget {
  String imageUrl;
  String title;
  void Function()? onPressed;
  CategoryCard({
     required this.imageUrl,
    required this.title,
    this.onPressed,
    super.key});
Widget? widget;
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height * 0.15;
    double fontSize=screenWidth * 0.1;
    return   Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: screenHeight,
          width: screenWidth,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(imageUrl),
            fit: BoxFit.cover,
            )
          ),
          child: Text(title.toString().toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            backgroundColor: Colors.black.withOpacity(0.5),
            fontSize: fontSize*.4,
            letterSpacing: 1.5,

          ),
          )
        ),
      ),
    );
  }
}
