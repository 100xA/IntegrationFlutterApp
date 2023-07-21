import "dart:convert";

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  /// Unique id given by [Firebase]
  final String? id;

  /// String name of each Users, composed of first and second name
  final String? name;

  /// Country of origin
  final String? origin;

  /// Timestamp of birthday
  final Timestamp? birthday;

  /// Int for job - partTime, fullTime and contractTime
  final int? job;

  /// Int for role - adminRole, userRole, spectatorRole
  final int? role;

  static const int partTime = 0;
  static const int fullTime = 1;
  static const int contractTime = 2;

  static const List<int> jobType = [
    Profile.fullTime,
    Profile.contractTime,
    Profile.partTime,
  ];

  static const int adminRole = 2;
  static const int userRole = 1;
  static const int spectatorRole = 0;

  static const List<int> roleType = [
    Profile.adminRole,
    Profile.userRole,
    Profile.spectatorRole,
  ];

  const Profile({
    this.id,
    required this.name,
    required this.origin,
    required this.birthday,
    required this.job,
    required this.role,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "origin": origin,
      "birthday": birthday,
      "job": job,
      "role": role,
    };
  }

  factory Profile.fromJson(Map<String, dynamic> map) => Profile(
        name: map["name"] as String?,
        origin: map["origin"] as String?,
        birthday: map["birthday"] as Timestamp?,
        job: map["job"] as int? ?? Profile.fullTime,
        role: map["role"] as int? ?? Profile.adminRole,
      );

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      name: map["name"] as String,
      origin: map["origin"] as String,
      birthday: map["birthday"] as Timestamp,
      job: map["job"] as int,
      role: map["role"] as int,
    );
  }

  String toJson() => json.encode(toMap());

  Profile copyWith({
    String? id,
    String? name,
    String? origin,
    Timestamp? birthday,
    int? job,
    int? role,
  }) =>
      Profile(
        id: id ?? this.id,
        name: name ?? this.name,
        origin: origin ?? this.origin,
        birthday: birthday ?? this.birthday,
        job: job ?? this.job,
        role: role ?? this.role,
      );

  @override
  List<Object?> get props => [id, name, origin, birthday, job, role];
}
