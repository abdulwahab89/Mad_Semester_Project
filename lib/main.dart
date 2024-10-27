import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moviepedia/firebase_options.dart';
import 'package:moviepedia/utils/provider/changeIcon.dart';
import 'package:moviepedia/utils/provider/starRating.dart';
import 'package:moviepedia/utils/routes/route.dart';
import 'package:moviepedia/utils/routes/routeNames.dart';
import 'package:moviepedia/view%20model/services/PostData/post_data.dart';
import 'package:moviepedia/view%20model/services/firebase_services/firebase_database/FirebaseDatabaseViewModel.dart';
import 'package:moviepedia/view/home_screen.dart';
import 'package:moviepedia/view/screens/dashboard_screen.dart';
import 'package:provider/provider.dart';

import 'view model/services/firebase_services/firebase_authentication/login_services/login_service.dart';
void main ()async{
WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

      ChangeNotifierProvider( create:(context)=>IconVisibility(),
      ),
        ChangeNotifierProvider( create:(context)=>StarVisibility(),
        ),
        ChangeNotifierProvider( create:(context)=>PostData(),
        ),

        ChangeNotifierProvider( create:(context)=>FirebaseDatabaseViewModel(),
        ),
        ChangeNotifierProvider( create:(context)=>LoginService(),

    ),
        ],
      // child: const MaterialApp(
      //   home: LabTask(),
      // ),
      child:   const MaterialApp(
debugShowCheckedModeBanner: false,
      // home: DashbordScreen(),
        initialRoute: RouteName.splashScreen,
        onGenerateRoute: Routes.generateRoute,
        // // initialRoute: RouteName.splashScreen,
        // onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
