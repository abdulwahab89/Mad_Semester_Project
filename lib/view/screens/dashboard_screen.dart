import 'package:flutter/material.dart';
import 'package:moviepedia/res/components/buttons/custom_button.dart';
import 'package:moviepedia/utils/colors.dart';

import '../../res/components/reusable_card.dart';
class DashboardScreen extends StatefulWidget {
   const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

 @override
  Widget build(BuildContext context) {
  Size screenSize=MediaQuery.of(context).size;
  double screenWidth=screenSize.width;
  double screenHeight=screenSize.height * 0.25;

  return   Scaffold(
    backgroundColor: AppColors.blackColor,
   body: Column(
     children: [
       Expanded(
         child: Stack(
           children: [
         Container(
                 decoration: const BoxDecoration(
          image:     DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage('https://wallpapercg.com/media/ts_orig/11595.webp')
          ),
                 ),
         ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 const CircleAvatar(
                     radius: 25,
                     backgroundImage:  NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2TgOv9CMmsUzYKCcLGWPvqcpUk6HXp2mnww&s')),
                 IconButton(onPressed: (){}, icon: const Icon(Icons.search),
                   color: Colors.white,
                 ),
               ],),
               Center(
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Align(
         
                       alignment: Alignment.bottomCenter,
                       child: CustomButton(
                         width: screenWidth*0.3,
                         title: 'Play Now',
                         borderRadius: 25,
                         icon: Icons.play_arrow,
                         color: Colors.black,
                       ),
                     ),
                     const SizedBox(
                       width: 10,
                     ),
                     Align(
                       alignment: Alignment.bottomCenter,
                       child: CustomButton(
                         width: screenWidth*0.3,
                         title: 'Details',
                         borderRadius: 25,
                         icon: Icons.play_arrow,
                         color: Colors.black,
                       ),
                     ),
         
                   ],
                 ),
               ),
         
           ],
         ),
       ),
       const Text('Trending Now'),
     ],
   )
    );
  }
}
