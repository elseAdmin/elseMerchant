import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elseMerchant/auth/models/api.dart';
import 'package:elseMerchant/auth/models/user_model.dart';
import 'package:flutter/material.dart';

class UserCrudModel extends ChangeNotifier{
  String collection;

  UserCrudModel(this.collection, this._api);

  Api _api ;

  List<CustomUser> users;

  Future<List<CustomUser>> fetchUsers() async {
    var result = await _api.getDataCollection();
    users = result.docs
    .map((doc) => CustomUser.fromMap(doc.data(), doc.id))
    .toList();
    return users;
  }

  Stream<QuerySnapshot> fetchUsersAsStream () {
    return _api.streamDataCollection();
  }

  Future<CustomUser> getUserById(String id) async{
    if(id == null || id.isEmpty){
      return null;
    }
    var doc = await _api.getDocumentById(id);
    print(doc);
    if(doc.data == null){
      return null;
    }
    return CustomUser.fromMap(doc.data(), doc.documentID);
  }

  Future removeUser(String id) async{
    await _api.removeDocument(id) ;
    return ;
  }

  Future updateUser(CustomUser data, String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addUser(CustomUser data) async{
    var result  = await _api.addDocument(data.toJson()) ;
    return result.id;
  }

  Future addUserById(CustomUser data) async{
    var result = await _api.addDocumentById(data.id, data.toJson());
    return ;
  }
}