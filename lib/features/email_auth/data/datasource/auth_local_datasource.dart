import 'package:firebase_auth/firebase_auth.dart';

import '../model/user_model.dart';

abstract class AuthLocalDataSource {
  Future<UserModel> currentUser();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final FirebaseAuth _firebaseAuth;

  AuthLocalDataSourceImpl({ required FirebaseAuth firebaseAuth })
      : _firebaseAuth = firebaseAuth;

  @override
  Future<UserModel> currentUser() async{
    return _currentUser();
  }

  UserModel _currentUser(){
    try {
      return _firebaseAuth.currentUser == null ? UserModel.empty
          : UserModel(
          uid: _firebaseAuth.currentUser!.uid,
          email: _firebaseAuth.currentUser!.email,
          name: _firebaseAuth.currentUser!.displayName,);
    } catch(e) {
      throw Exception('No current user');
    }
  }

  Stream<UserModel> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null ? UserModel.empty : firebaseUser.toUser;
      return user;
    });
  }

}

extension on User {
  UserModel get toUser {
    return UserModel(uid: uid, email: email, name: displayName);
  }
}
