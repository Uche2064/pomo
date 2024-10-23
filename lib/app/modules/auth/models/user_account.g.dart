// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAccount _$UserAccountFromJson(Map<String, dynamic> json) => UserAccount(
      uid: json['uid'] as String? ?? "",
      email: json['email'] as String? ?? "",
      nickName: json['nickName'] as String? ?? "",
      phoneNumber: json['phoneNumber'] as String? ?? "",
      fullName: json['fullName'] as String? ?? "",
      image: json['image'] as String? ?? "",
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    )..password = json['password'] as String?;

Map<String, dynamic> _$UserAccountToJson(UserAccount instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'nickName': instance.nickName,
      'phoneNumber': instance.phoneNumber,
      'fullName': instance.fullName,
      'image': instance.image,
      'uid': instance.uid,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
