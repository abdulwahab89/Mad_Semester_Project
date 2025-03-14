import 'package:flutter/material.dart';
import 'package:moviepedia/res/components/reusable_card.dart';

import '../../utils/colors.dart';
class ReusableMovieRow extends StatefulWidget {
  const ReusableMovieRow({super.key});

  @override
  State<ReusableMovieRow> createState() => _ReusableMovieRowState();
}

class _ReusableMovieRowState extends State<ReusableMovieRow> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const SizedBox(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Trending Now',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Text('See all',
                  style: TextStyle(
                    fontSize: kDefaultFontSize,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textColor4,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 7,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal:20.0),
                  child: ReusableCard(
                      url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRx0DKx_PphYeYUUa7wfPJpBGkG-wARHvt2Qw&s', title: 'Venom', subtitle: '2019'),
                );
              }),
        ),
      ],
    );
  }
}
