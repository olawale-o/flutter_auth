import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth/core/helper/auth_helper.dart';

import '../model/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> signUp(String email, String password);
  Future<UserModel> logIn(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  AuthRemoteDataSourceImpl({required this.firebaseAuth});
  @override
  Future<UserModel> logIn(String email, String password) {
    final user = _signUp(email, password);
    return user;
  }

  @override
  Future<UserModel> signUp(String email, String password) async {
    final user = _signUp(email, password);
    return user;
  }

  dynamic _signUp(String email, String password) async {
    try{
      UserCredential _userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      UserModel userModel = UserModel(
          additionalUserInfo: _userCredential.additionalUserInfo,
          user: _userCredential.user,
          credential: _userCredential.credential
      );
      return userModel;
    } on FirebaseAuthException catch(e){
      if (e.code == 'weak-password') {
        throw Exception("The password provided is too weak");
      } else if (e.code == 'email-already-in-use') {
        throw Exception('Email has been taken');
      }
    } catch(e) {
      throw Exception('Error $e');
    }
  }

  dynamic _login(String email, String password) async {
    try{
      UserCredential _userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      UserModel userModel = UserModel(
          additionalUserInfo: _userCredential.additionalUserInfo,
          user: _userCredential.user,
          credential: _userCredential.credential
      );
      return userModel;
    } on FirebaseAuthException catch(e){
      if (e.code == 'weak-password') {
        throw Exception("The password provided is too weak");
      } else if (e.code == 'email-already-in-use') {
        throw Exception('Email has been taken');
      }
    } catch(e) {
      throw Exception('Error $e');
    }
  }

}