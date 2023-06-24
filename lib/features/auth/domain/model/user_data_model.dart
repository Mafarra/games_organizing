// ignore_for_file: unnecessary_null_in_if_null_operators

import 'package:games_organizing/core/extensions/extensions.dart';

class UserDataModel {
  final int? id;
  final String? token;
  final String? name;
  final String? email;
  final Gender? gender;
  final ActiveCode? activeCode;
  final double? lat;
  final double? long;
  final String? location;

  UserDataModel({
    this.id,
    this.token,
    this.name,
    this.email,
    this.gender,
    this.activeCode,
    this.lat,
    this.long,
    this.location,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      id: json['id'] ?? null,
      token: json['token'] ?? null,
      name: json['name'] ?? null,
      email: json['email'] ?? null,
      gender: Gender.fromJson(json['gender']),
      activeCode: ActiveCode.fromJson(json['activeCode']),
      lat: json['lat'] ?? null,
      long: json['long'] ?? null,
      location: json['location'] ?? null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id.onNull(),
      'token': token.onNull(),
      'name': name.onNull(),
      'email': email.onNull(),
      'gender': gender!.toJson(),
      'activeCode': activeCode!.toJson(),
      'lat': lat,
      'long': long,
      'location': location.onNull(),
    };
  }
}

class Gender {
  final int? id;
  final String? name;

  Gender({
    this.id,
    this.name,
  });

  factory Gender.fromJson(Map<String, dynamic> json) {
    return Gender(
      id: json['id'] ?? null,
      name: json['name'] ?? null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id.onNull(),
      'name': name.onNull(),
    };
  }
}

class ActiveCode {
  final int? id;
  final String? name;

  ActiveCode({
    this.id,
    this.name,
  });

  factory ActiveCode.fromJson(Map<String, dynamic> json) {
    return ActiveCode(
      id: json['id'] ?? null,
      name: json['name'] ?? null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id.onNull(),
      'name': name.onNull(),
    };
  }
}
