import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../res/components/buttons/custom_button.dart';
import '../../res/components/reusable_row.dart';
import '../../utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).padding.top + 60),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: AppBar(
            elevation: 0,
            leading: const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: CircleAvatar(
                backgroundColor: AppColors.primaryColor,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.7),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    color: AppColors.textColor3,
                    onPressed: () {},
                    icon: const Icon(Icons.search_outlined),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final totalHeight = constraints.maxHeight;
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: totalHeight * 0.6,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: double.infinity,
                        width: double.infinity,
                        child: Image.asset(
                          'assets/images/drama.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 100.0),
                                  child: CustomButton(
                                    icon: Icons.play_arrow,
                                    textColor: Colors.white,
                                    title: 'Play',
                                    fontSize: kDefaultFontSize,
                                    color: AppColors.primaryColor,
                                    borderRadius: 100,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 100),
                                  child: CustomButton(
                                    textColor: Colors.white,
                                    title: 'Details',
                                    color: Colors.transparent,
                                    fontSize: kDefaultFontSize,
                                    borderRadius: 100,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: totalHeight * 0.41,
                  child: const ReusableMovieRow(),
                ),
                SizedBox(
                  height: totalHeight * 0.4,
                  child: const ReusableMovieRow(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
