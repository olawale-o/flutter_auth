import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../core/exceptions/exception.dart';

import '../model/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> signUp(String email, String password);
  Future<UserModel> logIn(String email, String password);
  Future<UserModel> signInWithGoogle();
  Future<UserModel> signInWithFacebook();
  Future<void> logout();

}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FacebookAuth facebookAuth;

  AuthRemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.facebookAuth,
  });
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
        email: _userCredential.user!.email,
        uid: _userCredential.user!.uid,
        name: _userCredential.user!.displayName,);
      return userModel;
    } on SocketException {
      throw NetworkException('Please check your internet connection');
    } on HttpException {
      throw ServerException('Unable to connect to server');
    } on FirebaseAuthException catch(e) {
      throw AuthException.fromCode(e.code);
    } catch(e) {
      throw Exception('Error $e');
    }
  }

  dynamic _login(String email, String password) async {
    try{
      UserCredential _userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      UserModel userModel = UserModel(
        email: _userCredential.user!.email,
        uid: _userCredential.user!.uid,
        name: _userCredential.user!.displayName,);
      return userModel;
    } on SocketException {
      throw NetworkException('Please check your internet connection');
    } on HttpException {
      throw ServerException('Unable to connect to server');
    } on FirebaseAuthException catch(e) {
      throw AuthException.fromCode(e.code);
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

  @override
  Future<UserModel> signInWithGoogle() async {
    final user = await _signInWithGoogle();
    return user;
  }

  dynamic _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await firebaseAuth.signInWithCredential(credential);
      UserModel userModel = UserModel(
        email: firebaseAuth.currentUser!.email,
        uid: firebaseAuth.currentUser!.uid,
        name: firebaseAuth.currentUser!.displayName);
      return userModel;
    } on SocketException {
      throw NetworkException('Please check your internet connection');
    } on HttpException {
      throw ServerException('Unable to connect to server');
    } on PlatformException catch(e) {
      print('PlatformException');
    } on FirebaseAuthException catch(e) {
      throw AuthException(e.code);
    } catch(e) {
      throw Exception('Error $e');
    }
  }

  @override
  Future<UserModel> signInWithFacebook() async {
    final user = await _signInWithFacebook();
    return user;
  }

  dynamic _signInWithFacebook() async {
    try {
      final LoginResult loginResult = await facebookAuth.login();
      final OAuthCredential facebookAuthCredential = FacebookAuthProvider
          .credential(loginResult.accessToken!.token);
      await firebaseAuth.signInWithCredential(facebookAuthCredential);
      UserModel userModel = UserModel(
        email: firebaseAuth.currentUser!.email,
        uid: firebaseAuth.currentUser!.uid,
        name: firebaseAuth.currentUser!.displayName);
      return userModel;
    }  on SocketException {
      throw NetworkException('Please check your internet connection');
    } on HttpException {
      throw ServerException('Unable to connect to server');
    } on FirebaseAuthException catch(e) {
      throw AuthException(e.code);
    } catch(e) {
      throw Exception('Error $e');
    }
  }
}