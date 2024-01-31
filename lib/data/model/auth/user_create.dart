import 'package:json_annotation/json_annotation.dart';

part 'user_create.g.dart';

@JsonSerializable()
class UserCreate {
  int? id;
  String? firstname;
  String? lastname;
  String? phone;
  String? password;
  dynamic emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  UserCreate({
    this.id,
    this.firstname,
    this.lastname,
    this.phone,
    this.password,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });


  factory UserCreate.fromJson(Map<String, dynamic> json) => _$UserCreateFromJson(json);
  Map<String, dynamic> toJson() => _$UserCreateToJson(this);
}
