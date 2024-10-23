import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_account.g.dart';

@JsonSerializable()
class UserAccount {
  String? email, password, nickName, phoneNumber, fullName, image, uid;
  DateTime? createdAt, updatedAt;

  UserAccount({
    this.uid = "",
    this.email = "",
    this.nickName = "",
    this.phoneNumber = "",
    this.fullName = "",
    this.image = "",
    this.createdAt,
    this.updatedAt,
  });

  factory UserAccount.fromJson(Map<String, dynamic> json) =>
      _$UserAccountFromJson(json);

  Map<String, dynamic> toJson() => _$UserAccountToJson(this);

  factory UserAccount.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return UserAccount.fromJson(data);
  }
}
