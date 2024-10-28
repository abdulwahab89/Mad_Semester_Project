import 'package:flutter/material.dart';
import 'package:moviepedia/res/components/custom_field/custom_field.dart';
import 'package:moviepedia/utils/colors.dart';
import 'package:moviepedia/utils/routes/routeNames.dart';
import 'package:moviepedia/utils/utils.dart';
import 'package:moviepedia/view%20model/services/firebase_services/firebase_authentication/login_services/login_service.dart';
import 'package:moviepedia/view%20model/services/validator/validator.dart';
import 'package:provider/provider.dart';

import '../../res/components/buttons/custom_button.dart';
import '../../utils/provider/changeIcon.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final _formkey=GlobalKey<FormState>();
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
            height: screenHeight,
            ),
            Center(
            child: Text("Login",
            style: TextStyle(
            fontFamily: 'Pacifico',
            fontSize: fontSize,
            color: AppColors.backgroundColor,
            ),
            ),
            ),

            Center(
              child: Form(
              key: _formkey,
              child:  Column(
              children: [
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
            ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: ()=> Utils.toastMessage("Coming soon"),

                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Forgotten password?'
                            ,
                            style: TextStyle(
                              color: AppColors.backgroundColor,
                              decoration: TextDecoration.underline,
                            )
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, RouteName.signUpScreen);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Don't have an account? Signup now",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.backgroundColor,
                            decoration:TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Consumer<LoginService>(builder: (context,provider,child)=>
                      CustomButton(
                        loading: provider.loading,
                        onPress: (){
                          if(_formkey.currentState!.validate()){
                            provider.loginService(context,_emailController.text.toString(), _passwordController.text.toString());
                          }
                        },
                        title: 'Login',
                        color: AppColors.backgroundColor,
                      ),
                  ),
                ],
              ),
            )


    );
  }
}
