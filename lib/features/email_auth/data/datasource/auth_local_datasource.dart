import 'package:firebase_auth/firebase_auth.dart';

import '../model/user_model.dart';

abstract class AuthLocalDataSource {
  Future<UserModel> currentUser();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final FirebaseAuth firebaseAuth;

  AuthLocalDataSourceImpl({ required this.firebaseAuth });

  @override
  Future<UserModel> currentUser() async{
    final user = UserModel(user: _currentUser());
    return user;
  }

  User? _currentUser(){
    try {
      return firebaseAuth.currentUser;
    } catch(e) {
      throw Exception('No current user');
    }
  }

}