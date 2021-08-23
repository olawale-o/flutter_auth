import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth/features/email_auth/domain/entity/user_entity.dart';

class AuthHelper {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  get user => _firebaseAuth.currentUser;

  Future signUp(String email, String password) async {
    try{
      UserCredential _userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      UserEntity userEntity = UserEntity(
          additionalUserInfo: _userCredential.additionalUserInfo,
          user: _userCredential.user,
          credential: _userCredential.credential
      );
      print('userEntity: $userEntity');
      print('User $_userCredential');
    } on FirebaseAuthException catch(e){
      if (e.code == 'weak-password') {
        print("The password provided is too weak");
      } else if (e.code == 'email-already-in-use') {
        print('Email has been taken');
      }
    } catch(e) {
      print('Error $e');
    }
  }

  Future login(String email, String password) async {
    try{
      UserCredential _userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      UserEntity userEntity = UserEntity(
          additionalUserInfo: _userCredential.additionalUserInfo,
          user: _userCredential.user,
          credential: _userCredential.credential
      );
      print('userEntity: $userEntity');
      print('User $_userCredential');
    } on FirebaseAuthException catch(e) {
        if (e.code == 'user-not-found') {
          print('Please create an account');
        } else if (e.code == 'wrong-password') {
          print('Wrong password');
        }
    } catch(e) {
      print('error $e');
    }
  }

  Future logOut() async {
    await _firebaseAuth.signOut();
  }
}