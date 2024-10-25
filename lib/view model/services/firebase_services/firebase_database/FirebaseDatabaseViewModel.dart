import 'package:flutter/cupertino.dart';
import 'package:moviepedia/Model/Firebase_database_model/Database_Model.dart';
import 'package:moviepedia/data/repo/firebase_repo/firebase_repo.dart';


class FirebaseDatabaseViewModel with ChangeNotifier {
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
  FirebaseDatabaseViewModel(){
    fetchData();
  }
  List<DatabaseModel> listData = [];
  final FirebaseRepo _repo = FirebaseRepo('Movies');
  Future<List<DatabaseModel>> fetchData() async {
    setLoading(true);

    try {
      listData = await _repo.getFirebaseData();
      setLoading(false);
      return listData;
    } catch (error) {
      setLoading(false);
      print('Error fetching data: $error');
      return [];
    }
  }
   searchDatabase(String value) async{
    var data=await fetchData();
    for (int i = 0; i < data.length; i++){
      setLoading(true);
      if(data[i].movieName!.toLowerCase()==value.toLowerCase()){
        return true;
      }
    }
    setLoading(false);
    return false;
    }
//   Future<List<DatabaseModel>> fetchData() async {
//     setLoading(true);
//
//     try {
//       listData = await _repo.getFirebaseData().then((value){
// print(value[0].movieName);
//       setLoading(false);
//       print(listData.length);
//       return listData;
//       });
//       setLoading(false);
//       return listData;
//     } catch (error) {
//       setLoading(false);
//       print('Error fetching data: $error');
//       return listData; }
//   }
}
