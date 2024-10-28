import 'package:flutter/material.dart';
import 'package:moviepedia/res/components/custom_field/custom_field.dart';
import 'package:moviepedia/utils/colors.dart';
import 'package:moviepedia/utils/routes/routeNames.dart';
import 'package:moviepedia/utils/utils.dart';
import 'package:moviepedia/view%20model/services/firebase_services/firebase_authentication/login_services/login_service.dart';
import 'package:moviepedia/view%20model/services/firebase_services/firebase_authentication/signup_service/signup_service.dart';
import 'package:moviepedia/view%20model/services/validator/validator.dart';
import 'package:provider/provider.dart';

import '../../res/components/buttons/custom_button.dart';
import '../../utils/provider/changeIcon.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  @override
  State<SignUp> createState() => _SignUpState();
}
class _SignUpState extends State<SignUp> {
  final _formkey=GlobalKey<FormState>();
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  final TextEditingController _userController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
    double screenWidth=screenSize.width;
    double fontSize=screenWidth * 0.09;
    double screenHeight=screenSize.height * 0.15;
    return  Scaffold(
        backgroundColor: AppColors.secondaryColor,
        appBar: AppBar(

          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight,
              ),
              Center(
                child: Text("Sign up",
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: fontSize,
                    color: AppColors.backgroundColor,
                  ),
                ),
              ),

              Form(
                key: _formkey,
                child:  Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: CustomField(

                        boxWidth: screenWidth*0.9,
                                                hintcolor: AppColors.textColor,
                        color: AppColors.backgroundColor,
                        textEditingController: _userController,
                        formFieldValidator:Validator.validate,
                        prefixIcon: const Icon(
                          Icons.email,
                          color: AppColors.backgroundColor,
                        ),
                        textHint: 'Username',),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: CustomField(

                        boxWidth: screenWidth*0.9,
                        onFieldSubmittedValue: (value){

                        },
                        hintcolor: AppColors.textColor,
                        color: AppColors.backgroundColor,
                        textEditingController: _emailController,
                        formFieldValidator:Validator.validate,
                        prefixIcon: const Icon(
                          Icons.email,
                          color: AppColors.backgroundColor,
                        ),
                        textHint: 'Email',),
                    ),
                    Consumer<IconVisibility>(
                      builder: (context,isVisible,child)=>
                          CustomField(
                            boxWidth: screenWidth*0.9,
                            hintcolor: AppColors.textColor,
                            obscureText: isVisible.isVisible,
                            onPressSuffixIcon: (){
                              isVisible.toggleVisibility();
                            },
                            textEditingController: _passwordController,
                            color: AppColors.backgroundColor,
                            suffixIcon: isVisible.isVisible? const Icon(
                              Icons.visibility_off,
                              color: AppColors.backgroundColor,
                            ):const Icon(
                              Icons.visibility,
                              color: AppColors.backgroundColor,
                            ),
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: AppColors.backgroundColor,
                            ),
                            textHint: 'password',
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: InkWell(
                  onTap: (){
                    Navigator.pushReplacementNamed(context, RouteName.loginScreen);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Already have an account? Login now",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.backgroundColor,
                        decoration:TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ),
              Consumer<SignupService>(builder: (context,provider,child)=>
                  CustomButton(
                    loading: provider.loading,
                    onPress: (){
                      if(_formkey.currentState!.validate()){
                        provider.signup(context,_emailController.text.toString(), _passwordController.text.toString(),_userController.text.toString());
                      }
                    },
                    title: 'Sign up',
                    color: AppColors.backgroundColor,
                  ),
              ),
            ],
          ),
        )


    );
  }
}
