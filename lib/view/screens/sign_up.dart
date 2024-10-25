import 'package:flutter/material.dart';
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
  SignupService signupService=SignupService();
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
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
        title:   Text("Signup",
          style: TextStyle(
            fontFamily: 'Pacifico',
            fontSize: fontSize*0.8,
            color: AppColors.backgroundColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
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
         signupService.signup(context,_emailController.text.toString(), _passwordController.text.toString(),_userNameController.text.toString());


              },
              child: CustomButton(
                  color: AppColors.backgroundColor,
                  title: 'Sign up',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
