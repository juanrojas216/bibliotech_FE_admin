// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(dynamic str) => UserModel.fromJson(str);

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final String nombre;
  final int id;

  UserModel({
    required this.nombre,
    required this.id,
  });

  UserModel copyWith({
    String? nombre,
    int? id,
  }) =>
      UserModel(
        nombre: nombre ?? this.nombre,
        id: id ?? this.id,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        nombre: json["nombre"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "id": id,
      };
}
