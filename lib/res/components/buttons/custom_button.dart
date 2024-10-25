import 'package:flutter/material.dart';
import 'package:moviepedia/utils/colors.dart';
class CustomButton extends StatefulWidget {
String title;
Color? color;
bool loading;
final VoidCallback? onPress;
double? height;
double? width;
double? borderRadius;
double? fontSize;
IconData? icon;
   CustomButton({
     this.height,
     this.width,
     this.icon,
     this.fontSize,
     this.borderRadius,
     required this.title,
     this.color,
     this.loading=false,
     super.key, this.onPress});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.loading?null:widget.onPress,
      child: Container(
        height: widget.height??40,
      width: widget.width?? 200,
      decoration: BoxDecoration(
        color: widget.color,
      borderRadius: BorderRadius.circular(widget.borderRadius??25),
      ),
      child: widget.loading? const Center(child: CircularProgressIndicator(
        color: Colors.white,
      ),):Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
    widget.icon != null? Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Icon (widget.icon,
      color: AppColors.secondaryColor,
       ),
    ):const SizedBox(),

            Center(
              child: Text(widget.title.toString(),
                style:  TextStyle(
                  color: AppColors.secondaryColor,
                fontSize:widget.fontSize??19,
                ),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
