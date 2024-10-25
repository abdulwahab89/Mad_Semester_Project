import 'package:flutter/material.dart';
import 'package:moviepedia/res/components/scrollable_widget/scrollable_widget.dart';
import 'package:moviepedia/utils/colors.dart';
import 'package:moviepedia/utils/routes/routeNames.dart';
import 'package:moviepedia/view model/services/firebase_services/firebase_authentication//signup_service/signup_service.dart';

import '../../res/components/buttons/custom_button.dart';
import '../../res/components/custom_field/custom_field.dart';
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  List<String> listPhNumber=['+92','+31','+41','+99'];
  String currentPrefix='+92';
  SignupService signupService=SignupService();
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  final TextEditingController _phoneController=TextEditingController();
  final TextEditingController _userNameController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
    double screenWidth=screenSize.width;
    double fontSize=screenWidth * 0.1;
    return  Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
        backgroundColor: Colors.transparent,
        title:   TweenAnimationBuilder(
          tween: Tween<double>(begin: 0,end: 1),
          builder: (BuildContext context, double value,Widget? child){
            return Opacity(opacity: value,
            child: Padding(padding: EdgeInsets.only(left:  value*(screenWidth*0.2)),

            child: child,),
            );
          },
          duration: const Duration(seconds: 1),
          child: Text("Signup",
            style: TextStyle(
              fontFamily: 'Pacifico',
              fontSize: fontSize*0.8,
              color: AppColors.backgroundColor,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: TweenAnimationBuilder(
tween: Tween<double>(begin: 0,end: 1),
          builder: (BuildContext context,double value, child){
          return Opacity(opacity: value,
          child: Padding(padding: EdgeInsets.symmetric(vertical:value*100),
          child: child,
          ),
          );
          },
          duration: const Duration(seconds: 1,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: CustomField(
                  textInputType: TextInputType.name,
                  color: AppColors.textColor,
                  prefixIcon: Icon(
                    Icons.account_box,
                    color: AppColors.textColor2,
                  ),
                  textHint: 'Enter your User-name',),
              ),

               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: CustomField(
                   textInputType: TextInputType.emailAddress,
                  textEditingController: _emailController,
                  color: AppColors.textColor,
                  prefixIcon: const Icon(
                    Icons.email,
                    color: AppColors.textColor2,
                  ),
                  textHint: 'Enter your email',),
               ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: CustomField(
                   textInputType: TextInputType.visiblePassword,
                  textEditingController: _passwordController,
                  color: AppColors.textColor,
                  suffixIcon:const Icon(
                    Icons.visibility,
                    color: AppColors.textColor2,
                  ),
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: AppColors.textColor2,
                  ),
                  textHint: 'Enter your password',
                             ),
               ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormFieldMenu(
              textEditingController: _phoneController,
                items: listPhNumber, prefix:currentPrefix),
          ),

              Padding(
                padding: const EdgeInsets.all(18.0),
                child: InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, RouteName.loginScreen);
                  },
                  child: const Text('Already have account? Login now'
                      ,
                      style: TextStyle(
                        color: AppColors.backgroundColor,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                ),
              ),
              InkWell(
                onTap: () {
           signupService.signup(context,_emailController.text.toString(), _passwordController.text.toString(),currentPrefix+_phoneController.text.toString(),_userNameController.text.toString());


                },
                child: CustomButton(
                    color: AppColors.backgroundColor,
                    title: 'Sign up',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
