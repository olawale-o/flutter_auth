import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserEntity extends Equatable {
  final AdditionalUserInfo? additionalUserInfo;
  final AuthCredential? credential;
  final User? user;

  UserEntity({
    required this.additionalUserInfo,
    required this.credential,
    required this.user,});

  factory UserEntity.fromJson(dynamic json) {
    return UserEntity(
      additionalUserInfo: json["additionalUserInfo"],
      user: json["user"],
      credential: json['credential'],
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [additionalUserInfo, user, credential];

}

