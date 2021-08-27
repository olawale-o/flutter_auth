import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/exceptions/exception.dart';

import '../model/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> signUp(String email, String password);
  Future<UserModel> logIn(String email, String password);
  Future<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  AuthRemoteDataSourceImpl({required this.firebaseAuth});
  @override
  Future<UserModel> logIn(String email, String password) async {
    final user = await _login(email, password);
    return user;
  }

  @override
  Future<UserModel> signUp(String email, String password) async {
    final user = await _signUp(email, password);
    return user;
  }

  dynamic _signUp(String email, String password) async {
    try{
      UserCredential _userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      UserModel userModel = UserModel(
          user: _userCredential.user,
      );
      return userModel;
    } on SocketException {
      throw NetworkException('Please check your internet connection');
    } on HttpException {
      throw ServerException('Unable to connect to server');
    } on FirebaseAuthException catch(e) {
      if (e.code == 'weak-password') {
        throw AuthException("The password provided is too weak");
      } else if (e.code == 'email-already-in-use') {
        throw AuthException('Email has been taken');
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
          user: _userCredential.user,
      );
      return userModel;
    } on SocketException {
      throw NetworkException('Please check your internet connection');
    } on HttpException {
      throw ServerException('Unable to connect to server');
    } on FirebaseAuthException catch(e) {
      if (e.code == 'weak-password') {
        throw AuthException("The password provided is too weak");
      } else if (e.code == 'email-already-in-use') {
        throw AuthException('Email has been taken');
      }
    } catch(e) {
      throw Exception('Error $e');
    }
  }

  @override
  Future<List<void>> logout() async {
    try{
      final result = await Future.wait([firebaseAuth.signOut()]);
      return result;
    } on SocketException {
      throw NetworkException('Please check your internet connection');
    } on HttpException {
      throw ServerException('Unable to connect to server');
    } catch(e) {
      throw Exception('Error $e');
    }
  }

}