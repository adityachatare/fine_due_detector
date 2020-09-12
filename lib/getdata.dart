//import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class GetData{
  getLatestData(String num){
    return Firestore.instance
                    .collection('fines')
                    .where('vehicleno', isEqualTo: num)
                    
                    .getDocuments();
  }
}