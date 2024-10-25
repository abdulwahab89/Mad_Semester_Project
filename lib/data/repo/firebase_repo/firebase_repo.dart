import 'package:firebase_database/firebase_database.dart';
import 'package:moviepedia/Model/Firebase_database_model/Database_Model.dart';

class FirebaseRepo {
  String id;
  final DatabaseReference _database = FirebaseDatabase.instance.ref();
  FirebaseRepo(this.id);
  List<DatabaseModel> listDatabase = [];

  Future<List<DatabaseModel>> getFirebaseData() async {
    try {
      DataSnapshot dataSnapshot = await _database.child(id).get();

      if (dataSnapshot.value != null) {
        Map<dynamic, dynamic> data = dataSnapshot.value as Map<dynamic, dynamic>;


        data.forEach((key, value) {
          Map<dynamic, dynamic> item = Map<dynamic, dynamic>.from(value);
          listDatabase.add(DatabaseModel.fromMap(item));
        });
      }
      else{

       }

      return listDatabase;
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }
}
