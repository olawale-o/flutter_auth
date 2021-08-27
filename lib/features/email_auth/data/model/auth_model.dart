import 'package:firebase_auth/firebase_auth.dart';
import 'user_model.dart';
import '../../domain/entity/auth_entity.dart';

class AuthModel extends AuthEntity {
  final AdditionalUserInfo? additionalUserInfo;
  final AuthCredential? credential;
  final UserModel? user;
  AuthModel({
    required this.additionalUserInfo,
    required this.credential,
    required this.user,
  }) : super(additionalUserInfo: additionalUserInfo, credential: credential, user: user);

  factory AuthModel.fromJson(dynamic json) {
    return AuthModel(
      additionalUserInfo: json["additionalUserInfo"],
      user: json["user"],
      credential: json['credential'],
    );
  }

}