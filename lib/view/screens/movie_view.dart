import 'package:flutter/material.dart';
import 'package:moviepedia/Model/Firebase_database_model/Database_Model.dart';
import 'package:moviepedia/res/components/buttons/custom_button.dart';
import 'package:moviepedia/utils/colors.dart';
class MovieView extends StatelessWidget {
 DatabaseModel model;
     MovieView({
      required this.model,
    super.key});
  @override
  Widget build(BuildContext context) {
    print(model.movieName);

    return   Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
            width: double.infinity,
            decoration:  BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(model.imageUrl.toString()))
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
                      image: DecorationImage(image: NetworkImage(model.imageUrl.toString()),
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
                      Text(model.movieName.toString(),
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
                            title: model.movieRating.toString()),
                        const SizedBox(width: 15,),
                        CustomButton(
                            height: 15,
                            width: 75,
                            fontSize: 10,
                            borderRadius: 25,
                            color: AppColors.backgroundColor,
                            title: model.movieYear.toString()),
                      ],
                    ),
        const Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Text('Movie Category',
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
                            title: model.movieCategory!.name),
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
                  SafeArea(child: Text(model.description.toString(),
                  style: const TextStyle(
                    color: AppColors.textColor3,
        
                  ),
                  ))
                    ],),
                ),
        
              ),
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
                      const Text('Review',
                        style: TextStyle(
                          color: AppColors.textColor3,
                          fontSize: 12,
                        ),
                      ),
                      SafeArea(child: Text(model.description.toString(),
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
      ),
    );
  }
}
