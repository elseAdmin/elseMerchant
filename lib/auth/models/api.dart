
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elseMerchant/database_manager.dart';
import 'dart:async';

class Api{
  DatabaseManager databaseManager = new DatabaseManager();
  final String path;
  CollectionReference ref;

  Api( this.path ) {
    final FirebaseFirestore _db = databaseManager.getStoreReference();
    ref = _db.collection(path);
  }

  Future<QuerySnapshot> getDataCollection() {
    return ref.get() ;
  }
  Stream<QuerySnapshot> streamDataCollection() {
    return ref.snapshots() ;
  }
  Future<DocumentSnapshot> getDocumentById(String id) {
    return ref.doc(id).get();
  }
  Future<void> removeDocument(String id){
    return ref.doc(id).delete();
  }
  Future<DocumentReference> addDocument(Map data) {
    return ref.add(data);
  }
  Future<void> addDocumentById(String id,Map data) {
    return ref.document(id).setData(data);
  }
  Future<void> updateDocument(Map data , String id) {
    return ref.document(id).update(data) ;
  }


}