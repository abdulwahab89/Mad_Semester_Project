import 'package:flutter/material.dart';
import 'package:moviepedia/res/components/custom_field/custom_field.dart';
import 'package:moviepedia/utils/colors.dart';
import 'package:moviepedia/view%20model/services/firebase_services/firebase_authentication/login_services/login_service.dart';
import 'package:moviepedia/view%20model/services/firebase_services/firebase_database/FirebaseDatabaseViewModel.dart';
import 'package:moviepedia/view/screens/post_screen.dart';
import 'package:provider/provider.dart';

import '../../Model/Firebase_database_model/Database_Model.dart';
import '../../res/components/reusable_card.dart';
import '../../utils/routes/routeNames.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final LoginService _loginService = LoginService();
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height * 0.15;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        clipBehavior: Clip.hardEdge,
        backgroundColor: AppColors.backgroundColor,
        child: const Icon(Icons.add, color: AppColors.textColor4),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => PostScreen()));
        },
      ),
      backgroundColor: AppColors.secondaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.backgroundColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Movie List',
              style: TextStyle(
                color: AppColors.secondaryColor,
                fontSize: screenWidth * 0.050,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            ],
        ),
        leading: InkWell(
          onTap: () {
            _loginService.logOutService(context);
          },
          child: const Icon(Icons.exit_to_app_outlined, color: AppColors.secondaryColor),
        ),
      ),
      body: StreamBuilder<Map<String, List<DatabaseModel>>>(
        stream: Provider.of<FirebaseDatabaseViewModel>(context).getMoviesStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'No movies found',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            );
          }

          final moviesByCategory = snapshot.data!;
          final movieList = moviesByCategory.values.expand((e) => e).toList();
          return GridView.builder(
            itemCount: movieList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: 2 / 3,
            ),
            itemBuilder: (context, index) {
              final movie = movieList[index];

              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RouteName.movieScreen, arguments: movie);
                },
                child: ReusableCard(
                  url: movie.imageUrl ?? '',
                  title: movie.movieRating ?? 'Unknown', subtitle: movie.movieYear ?? 'Unknown Year',

                ),
              );
            },
          );
        },
      ),
    );
  }
}
