import 'package:flutter/material.dart';
import 'package:moviepedia/res/star_rating.dart';

class StarVisibility with ChangeNotifier {

  final List<bool> _isVisible = List.generate(5, (index) => false);
int count=0;
  List<bool> get isVisible => _isVisible;

  // Toggle visibility for a specific star
  void toggleVisibility(int index) {
    if (index >= 0 && index < _isVisible.length) {
      _isVisible[index] = !_isVisible[index];
      if(isVisible[index] && count>=0){
        count++;
      }else if(!isVisible[index] && count>0){
        count--;
      }
      print(count);
      notifyListeners();
    }
  }
}
