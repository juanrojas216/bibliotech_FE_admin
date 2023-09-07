// To parse this JSON data, do
//
//     final autor = autorFromJson(jsonString);

import 'dart:convert';

List<Autor> autorFromJson(dynamic data) {
  List<dynamic> str = data;
  return List<Autor>.from(str.map((x) => Autor.fromJson(x)));
}

String autorToJson(List<Autor> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Autor {
    final String biografia;
    final DateTime fechaNacimiento;
    final int id;
    final String nacionalidad;
    final String nombre;

    Autor({
        required this.biografia,
        required this.fechaNacimiento,
        required this.id,
        required this.nacionalidad,
        required this.nombre,
    });

    Autor copyWith({
        String? biografia,
        DateTime? fechaNacimiento,
        int? id,
        String? nacionalidad,
        String? nombre,
    }) => 
        Autor(
            biografia: biografia ?? this.biografia,
            fechaNacimiento: fechaNacimiento ?? this.fechaNacimiento,
            id: id ?? this.id,
            nacionalidad: nacionalidad ?? this.nacionalidad,
            nombre: nombre ?? this.nombre,
        );

    factory Autor.fromJson(Map<String, dynamic> json) => Autor(
        biografia: json["biografia"],
        fechaNacimiento: DateTime.parse(json["fechaNacimiento"]),
        id: json["id"],
        nacionalidad: json["nacionalidad"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toJson() => {
        "biografia": biografia,
        "fechaNacimiento": "${fechaNacimiento.year.toString().padLeft(4, '0')}-${fechaNacimiento.month.toString().padLeft(2, '0')}-${fechaNacimiento.day.toString().padLeft(2, '0')}",
        "id": id,
        "nacionalidad": nacionalidad,
        "nombre": nombre,
    };
}
