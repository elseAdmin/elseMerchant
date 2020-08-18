import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

import '../StartUpData.dart';
import 'models/user_model.dart';

abstract class BaseAuth {
  Future<String> signInwithPhoneNumber(AuthCredential credential);
  Future<CustomUser> currentUser();
  Future<void> signOut();

  verifyPhoneNumber(
      {String phoneNumber,
      Duration timeout,
      PhoneVerificationCompleted verificationCompleted,
      PhoneVerificationFailed verificationFailed,
      PhoneCodeSent codeSent,
      PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout}) {}
}

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<String> signInwithPhoneNumber(AuthCredential credential) async {
    User firebaseUser =
        (await _firebaseAuth.signInWithCredential(credential)).user;
    CustomUser user = CustomUser(firebaseUser.uid,firebaseUser.phoneNumber,firebaseUser.displayName,firebaseUser.email);
    return firebaseUser?.uid;
  }

  @override
  Future<CustomUser> currentUser() async {
    final User firebaseUser =  _firebaseAuth.currentUser;
    CustomUser user;
    if(firebaseUser!=null && firebaseUser.uid!=null) {
      user = CustomUser(
          firebaseUser.uid, firebaseUser.phoneNumber, firebaseUser.displayName,
          firebaseUser.email);
    }
    StartupData.user=user;
    return user;
  }

  @override
  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  @override
  verifyPhoneNumber(
      {String phoneNumber,
      Duration timeout,
      PhoneVerificationCompleted verificationCompleted,
      PhoneVerificationFailed verificationFailed,
      PhoneCodeSent codeSent,
      PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout}) async {
    return await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }
}