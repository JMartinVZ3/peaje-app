import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String uid;
  final String name;
  final String lastName;
  final String city;
  final String email;
  final bool active;
  final String photoUrl;
  final String identifierUrl;
  final int identifierNumber;
  final List<String> journeyChecks;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.uid,
    required this.name,
    required this.lastName,
    required this.city,
    required this.email,
    required this.active,
    required this.photoUrl,
    required this.identifierUrl,
    required this.identifierNumber,
    required this.journeyChecks,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object> get props => [
        uid,
        name,
        lastName,
        city,
        email,
        active,
        photoUrl,
        identifierUrl,
        identifierNumber,
        journeyChecks,
        createdAt,
        updatedAt,
      ];

  @override
  bool get stringify => false;
}
