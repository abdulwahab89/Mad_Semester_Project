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

       width: double.infinity, // Ensure the Stack takes the full width
       height: 250, // Define a fixed height for the Stack
       child: Stack(
         children: [
           Container(
             decoration: BoxDecoration(

                 image: DecorationImage(image: NetworkImage(url),
    fit: BoxFit.cover,

               )
             ),

           ),
           Positioned(
             bottom: -8,
             left: -10, // Position the Card to start from the left
             right: -10, // Ensure the Card stretches to the right
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
