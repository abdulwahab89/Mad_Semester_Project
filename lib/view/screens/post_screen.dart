
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moviepedia/Model/Firebase_database_model/Database_Model.dart';
import 'package:moviepedia/res/components/buttons/custom_button.dart';
import 'package:moviepedia/res/components/custom_field/custom_field.dart';
import 'package:moviepedia/res/star_rating.dart';
import 'package:moviepedia/utils/provider/starRating.dart';
import 'package:moviepedia/view%20model/services/PostData/post_data.dart';
import 'package:moviepedia/view%20model/services/firebase_services/firebase_database/FirebaseDatabaseViewModel.dart';
import 'package:provider/provider.dart';
import '../../utils/colors.dart';
import '../../utils/utils.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  int? selectedYear;
  MovieCategory? selectedCategory;
  XFile?  selectedImage;
  List<MovieCategory> catogories=MovieCategory.values;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<int> years = List.generate(50, (index) => 2024 - index);
  final ImagePicker picker = ImagePicker();
FirebaseDatabaseViewModel firebaseDatabaseViewModel=FirebaseDatabaseViewModel();

  TextEditingController descriptionController=TextEditingController();
  TextEditingController reviewController=TextEditingController();
  int rating=0;
  TextEditingController nameController=TextEditingController();
  PostData postData=PostData();
  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
    double screenWidth=screenSize.width;
    double screenHeight=screenSize.height * 0.15;
    double fontSize=screenWidth * 0.1;
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Post Movie Review'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(
          children: [
            Consumer<PostData>(
              builder: (context,value,child){
                print(selectedImage);
                return  GestureDetector(
                  onTap:() async{
                    selectedImage=await value.selectImage();
                    },
                  child: Container(
                    height: screenHeight * 2,
                    width: screenWidth * 0.6,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 3),
                      image: value.selectedImage != null
                          ? DecorationImage(
                        image: FileImage(File(value.selectedImage!.path)),
                        fit: BoxFit.cover,
                      )
                          : null,
                    ),
                    child: value.selectedImage == null
                        ? Center(
                      child: Icon(
                        Icons.add_a_photo,
                        size: fontSize,
                        color: Colors.black,
                      ),
                    )
                        : null,
                  ),
                );
                },
             ),
           Divider(
             height: screenHeight*0.4,
           ),
           Text("Name",
             style:  TextStyle(
               color: Colors.black,
               fontSize: fontSize,
               fontWeight: FontWeight.bold,
             ),

           ),
           SizedBox(
             height: screenHeight*0.4,
             width: screenWidth*0.5,
             child:  CustomField(color: Colors.black,
               formFieldValidator: (value){
           if(value!.isEmpty){
           return "Please submit name";
           }else{
           return null;
           }
           },
               textEditingController: nameController,
             ),
           ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Text("Year",
               style:  TextStyle(
                 color: Colors.black,
                 fontSize: fontSize,
                 fontWeight: FontWeight.bold,
               ),
             ),
           ),
           DropdownButton<int>(
             hint: const Text('Select year'),
             value: selectedYear,
             onChanged: (int? newValue) {
               setState(() {
                 selectedYear = newValue;
               });
             },
             items: List.generate(50, (index) => 2024 - index).map<DropdownMenuItem<int>>((int year) {
               return DropdownMenuItem<int>(
                 value: year,
                 child: Text(year.toString()),
               );
             }).toList(),
           ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Category",
                style:  TextStyle(
                  color: Colors.black,
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            DropdownButton<MovieCategory>(
              hint: const Text('Select category'),
              value: selectedCategory,
              onChanged: (MovieCategory? newValue) {
                setState(() {
                  selectedCategory = newValue;
                });
              },
              items: List.generate(catogories.length-1, (index) => MovieCategory.values[index]).map<DropdownMenuItem<MovieCategory>>((MovieCategory category) {
                return DropdownMenuItem<MovieCategory>(
                  value: category,
                  child: Text(category.name.toString()),
                );
              }).toList(),
            ),

            Text('Rating',
             style: TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: fontSize,
             ),
           ),
           Container(
             height: screenHeight*0.5,
             width: screenWidth*1,
             decoration: const BoxDecoration(
               color: Colors.black,
             ),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: List.generate(5, (index) {
                 return Consumer<StarVisibility>(
                   builder: (context,value,child){
                    rating= value.count;
                     return StarRating(
                       onPressed:() => value.toggleVisibility(index),
                       color: value.isVisible[index]? Colors.yellow: Colors.white,
                     );
                   },

                 );
               }),
             ),
           ),
           const Text('Description',
             style: TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: 25,
             ),
           ),
                   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator:(value){

                        if(value!.isEmpty){
                          return "Please submit description";
                        }else{
                          return null;
                        }
                      },
                      controller: descriptionController,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        border:OutlineInputBorder(),
                      ),
                    ),
                  ),
           const Text('Review',
             style: TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: 25,
             ),
           ),
            Padding(
             padding: const EdgeInsets.all(8.0),
             child: TextFormField(
               validator: (value){
                 if(value!.isEmpty){
                   return "Please submit review";
                 }else{
                   return null;
                 }
               },
               controller: reviewController,
               maxLines: 3,
               decoration: const InputDecoration(
                 border:OutlineInputBorder(),
               ),
             ),
           ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Consumer<PostData>(
                builder: (context,value,child){
                 return  CustomButton(
                   loading: value.isLoading,
                   title: 'Submit',
                   onPress: () async=> _formKey.currentState!.validate()?await value.postUserData(selectedImage,descriptionController.text.toString(),selectedYear.toString(),rating.toString(),nameController.text.toString(),reviewController.text.toString(),selectedCategory,context ):Utils.toastMessage("Enter missing details"),
                   color:AppColors.blackColor,
                 );
                }
              ),
            ),

          ],
        )),
      )
    );
  }
}
