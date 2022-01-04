import '../../domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  final String? email;
  final String uid;
  final String? name;

  const UserModel({required this.uid, this.email, this.name})
      : super(uid: uid, email: email, name: name);

  factory UserModel.fromJson(dynamic json) {
    return UserModel(
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
    );
  }

  static const empty = UserModel(uid: '');

  bool get isEmpty => this == UserModel.empty;

  bool get isNotEmpty => this != UserModel.empty;

  @override
  List<Object?> get props => [uid, name, email];

}

