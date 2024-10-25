
import 'package:flutter/material.dart';
class CustomRow extends StatelessWidget {

   CustomRow({
    this.title,
     this.widget,
    super.key});
String? title;
   Widget? widget;

  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of( context).size;
    double screenWidth=screenSize.width;
    double fontSize=screenWidth * 0.1;

    return Row(

      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(title.toString(),
          style:  TextStyle(
            color: Colors.black,
            fontSize: fontSize*0.5,
            fontWeight: FontWeight.bold,
          ),

        ),
         widget!,
      ],

    );
  }
}
