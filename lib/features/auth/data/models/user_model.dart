import 'dart:convert';
import 'package:peaje_client/features/auth/domain/entities/user.dart';

UserModel userFromJson(String str) => UserModel.fromJson(json.decode(str));

String userToJson(UserModel data) => json.encode(data.toJson());

class UserModel extends User {
  UserModel({
    required String uid,
    required String name,
    required String lastName,
    required String city,
    required String email,
    required bool active,
    required String photoUrl,
    required String identifierUrl,
    required int identifierNumber,
    required List<String> journeyChecks,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super(
          uid: uid,
          name: name,
          lastName: lastName,
          city: city,
          email: email,
          active: active,
          photoUrl: photoUrl,
          identifierUrl: identifierUrl,
          identifierNumber: identifierNumber,
          journeyChecks: journeyChecks,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json["_id"],
        name: json["name"],
        lastName: json['lastName'],
        city: json['city'],
        email: json["email"],
        active: json["active"],
        photoUrl: json["photoUrl"],
        identifierUrl: json["identifierUrl"],
        identifierNumber: json["identifierNumber"],
        journeyChecks: List<String>.from(json["journeyChecks"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": uid,
        "name": name,
        "lastName": lastName,
        "city": city,
        "email": email,
        "active": active,
        "photoUrl": photoUrl,
        "identifierUrl": identifierUrl,
        "identifierNumber": identifierNumber,
        "favorites": List<dynamic>.from(journeyChecks.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
