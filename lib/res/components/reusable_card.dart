import 'package:flutter/material.dart';
import 'package:moviepedia/utils/colors.dart';

class ReusableCard extends StatelessWidget {
  final String url;
  final String subtitle;
  final String title;

  const ReusableCard({
    required this.url,
    required this.title,
    required this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(

       width: double.infinity,
       height: 250,
       child: Stack(
         children: [
           Container(
             decoration: BoxDecoration(

                 image: DecorationImage(image: NetworkImage(url,
                 ),

    fit: BoxFit.cover,
               )
             ),
           ),
           Positioned(
             bottom: -8,
             left: -10,
             right: -10,
             child: SizedBox(

               child: Card(
                 color: Colors.black54,
                 child: ListTile(
                   title: Text(title,
                  style: const TextStyle(
                    fontSize: 10,
                    color: AppColors.secondaryColor,
                  ),
                   ),
                   subtitle: Text(subtitle,
                     style:const TextStyle(
                       fontSize: 10,
                       color: AppColors.textColor2,
                     ),
                   ),
                 ),
               ),
             ),
           ),
         ],
       ),
     );
  }
}
