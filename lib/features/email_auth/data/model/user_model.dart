import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  final User? user;
  UserModel({
    required this.user,
  }) : super(user: user);

  factory UserModel.fromJson(dynamic json) {
    return UserModel(
      user: json["user"],
    );
  }

}