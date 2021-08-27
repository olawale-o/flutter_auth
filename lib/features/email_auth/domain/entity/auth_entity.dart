import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'user_entity.dart';

class AuthEntity extends Equatable {
  final AdditionalUserInfo? additionalUserInfo;
  final AuthCredential? credential;
  final UserEntity? user;

  AuthEntity({
    required this.additionalUserInfo,
    required this.credential,
    required this.user,});

  factory AuthEntity.fromJson(dynamic json) {
    return AuthEntity(
      additionalUserInfo: json["additionalUserInfo"],
      user: json["user"],
      credential: json['credential'],
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [additionalUserInfo, user, credential];
}