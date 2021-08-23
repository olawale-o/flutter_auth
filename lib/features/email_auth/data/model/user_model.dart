import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  final AdditionalUserInfo? additionalUserInfo;
  final AuthCredential? credential;
  final User? user;
  UserModel({
    required this.additionalUserInfo,
    required this.credential,
    required this.user,
}) : super(additionalUserInfo: additionalUserInfo, credential: credential, user: user);

  factory UserModel.fromJson(dynamic json) {
    return UserModel(
      additionalUserInfo: json["additionalUserInfo"],
      user: json["user"],
      credential: json['credential'],
    );
  }

}