import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? email;
  final String uid;
  final String? name;
  const UserEntity({required this.uid, this.email, this.name});

  factory UserEntity.fromJson(dynamic json) {
    return UserEntity(
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [uid, email, name];

}

