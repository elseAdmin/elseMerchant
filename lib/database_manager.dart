import 'dart:collection';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:logger/logger.dart';

import 'StartUpData.dart';

class DatabaseManager {
  final logger = Logger();
  static FirebaseFirestore store;
  DatabaseReference baseDatabase, eventDatabase, dealsDatabase;

  Map<String, List> universeVsParticipatedEvents = HashMap();
  static Map activityTimelineMap;

  FirebaseStorage storageRef;


  DatabaseManager() {
    if (storageRef == null) {
      storageRef = FirebaseStorage.instance;
    }
    if (store == null) {
      store =FirebaseFirestore.instance;
    }
    if (baseDatabase == null) {
      baseDatabase =
          FirebaseDatabase.instance.reference().child(StartupData.dbreference);
    }
  }

  /// startup data methods  - start


  DatabaseReference getEventsDBRef() {
    return baseDatabase.child('eventStaticData');
  }

  DatabaseReference getDealsDBRef() {
    return baseDatabase.child('dealsStaticData');
  }

  DatabaseReference getShopsDBRef() {
    return baseDatabase.child('shopStaticData');
  }

  DatabaseReference getMetaConfDBRef() {
    return baseDatabase.child("metaConf");
  }

  DatabaseReference getBaseDBRef() {
    return baseDatabase;
  }

  FirebaseFirestore getStoreReference() {
    return store;
  }

  FirebaseStorage getStorageReference() {
    return storageRef;
  }

}
