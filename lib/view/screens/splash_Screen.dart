
import 'package:flutter/material.dart';
import 'package:moviepedia/utils/colors.dart';
import 'package:moviepedia/view%20model/SessionController/session_controller.dart';
import 'package:moviepedia/view%20model/services/splash_service.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  final SplashService _service=SplashService();
  @override
  void initState() {
    _service.isLogin(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'MoviePy',
              style: TextStyle(
                fontSize: 50,
                fontFamily: 'Pacifico',
                color: AppColors.secondaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
