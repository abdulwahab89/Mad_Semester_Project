import 'package:flutter/material.dart';
import 'package:moviepedia/utils/colors.dart';
class CustomField extends StatelessWidget {
  final String? textHint;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final bool obscureText;
  final VoidCallback? onPressSuffixIcon;
   final Color color;
   final TextAlign? textAlign;
  final Color? hintcolor;
  final FormFieldValidator? formFieldValidator;
   final TextEditingController? textEditingController;
  final FormFieldSetter? onFieldSubmittedValue;
  final TextInputType? textInputType;
  final double? borderSideWidth;
  const CustomField({
     this.textInputType,
     this.textHint,
    this.borderSideWidth,
     this.onPressSuffixIcon,
   this.prefixIcon,
     this.suffixIcon,
    this.textAlign,
     this.hintcolor,
     this.obscureText=false ,
     required this.color,
   this.formFieldValidator,
     this.textEditingController,
     this.onFieldSubmittedValue,
     super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: textAlign??TextAlign.start,
      onFieldSubmitted: onFieldSubmittedValue,
      validator: formFieldValidator,
      controller: textEditingController,
      style:const TextStyle(
    color: AppColors.textColor,
      ),
      obscureText: obscureText,
      decoration: InputDecoration(
          hintText: textHint,
          hintStyle:  TextStyle(
          color: hintcolor,

          ),
contentPadding: const EdgeInsets.all(8),
        prefixIcon:prefixIcon,
        suffixIcon: SizedBox(
          height: 1,
          width: 1,
          child: InkWell(

              onTap: onPressSuffixIcon,
              child: suffixIcon),
        ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: borderSideWidth??1,
              color: color, // Border color when not focused
            ),
          ),
    disabledBorder:OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
      ),
    ),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide:  BorderSide(
        color: color,
    )),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        borderSide:  BorderSide(
          width: 100,
          color: color,
        )
        )
      ),
    );
  }
}
