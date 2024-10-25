import 'package:flutter/material.dart';
import 'package:moviepedia/res/components/buttons/custom_button.dart';
import 'package:moviepedia/utils/colors.dart';
class MovieView extends StatelessWidget {
  final String url;
  final String title;
  final String movieDescription;
  final String coverUrl;
  final String movieRating;
  final String movieYear;
    const MovieView({
    required this.url,
     required this.title,
      required this.coverUrl,
      required this.movieRating,
      required this.movieYear,
     required this.movieDescription,
    super.key});
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
          width: double.infinity,
          decoration:  BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(coverUrl))
          ),
          ),
          CustomButton(

            title: 'Back to search',
          height: 50,
            borderRadius: 0,
          icon: Icons.arrow_back_sharp,
            width: double.infinity,
            color: AppColors.backgroundColor,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  height: 250,
                  width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(url),
                    fit: BoxFit.cover,

                    ),
                  ),
                ),
              ),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 1.0,vertical: 8),
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 8,
                      bottom: 4),
                      child: Text('TITLE',
                      style: TextStyle(
                        fontSize: 12,

                        fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                      ),
                      ),
                    ),
                    Text(title.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                 fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                    ),
                     const SizedBox(
                       height: 20,
                     ),
                     Padding(
                       padding: const EdgeInsets.only(bottom: 10),
                       child: RichText(text: const TextSpan(children: [
                        TextSpan(
                          text: 'POPULARITY',
                          style: TextStyle(
                            fontSize: 12,

                            fontWeight: FontWeight.bold,
                            color: AppColors.textColor2,
                          )
                        ),
                         WidgetSpan(
                           child: SizedBox(width: 20),
                         ),
                         TextSpan(
                           text: 'RELEASE YEAR'
                       ,style: TextStyle(
                       fontSize: 12,
                           fontWeight: FontWeight.bold,
                           color: AppColors.textColor2,
                       )
                         )
                       ])),
                     ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomButton(
                          height: 15,
                          width: 75,
                          fontSize: 10,
                          borderRadius: 25,
                          color: AppColors.backgroundColor,
                          title: movieRating),
                      const SizedBox(width: 15,),
                      CustomButton(
                          height: 15,
                          width: 75,
                          fontSize: 10,
                          borderRadius: 25,
                          color: AppColors.backgroundColor,
                          title: movieYear),
                    ],
                  ),
const Padding(
  padding: EdgeInsets.only(top: 10.0),
  child: Text('SEARCH  FOR  YOUTUBE  TRAILER',
  style:TextStyle(
    fontSize: 10,
    letterSpacing: 1,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor2,
  ),
  ),
),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0,top: 4),
                      child: CustomButton(
                          height: 30,
                          width: 100,
                          fontSize: 10,
                          borderRadius: 10,
                          color: AppColors.materialBlueColor,
                          title: 'Search now'),
                    ),
                  ],
                               ),
               )

            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 250,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.backgroundColor,
              ),
              child:  Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                const Text('OVERVIEW',
                style: TextStyle(
                  color: AppColors.textColor3,
                fontSize: 12,
                ),
                ),
                SafeArea(child: Text(movieDescription.toString(),
                style: const TextStyle(
                  color: AppColors.textColor3,

                ),
                ))
                  ],),
              ),

            ),
          )
        ],
      ),
    );
  }
}
