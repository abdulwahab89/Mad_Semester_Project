import 'package:flutter/material.dart';
class StarRating extends StatefulWidget {
  bool? isSelected;
   StarRating({
    this.isSelected,
     this.onPressed,
     this.color,
    super.key});
   Color? color;
void Function()? onPressed;
  @override
  State<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed:widget.onPressed,
     icon: Icon(Icons.star,
     color:widget.color,
     ));
      }
}
