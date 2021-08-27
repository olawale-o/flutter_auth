import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserEntity extends Equatable {
  final User? user;

  UserEntity({required this.user,});

  factory UserEntity.fromJson(dynamic json) {
    return UserEntity(
      user: json["user"],
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [user];

}

