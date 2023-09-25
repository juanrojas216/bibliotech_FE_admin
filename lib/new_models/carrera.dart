// To parse this JSON data, do
//
//     final carrera = carreraFromJson(jsonString);

import 'dart:convert';

List<Carrera> carrerasFromJson(dynamic data) {
  List<dynamic> str = data;
  return List<Carrera>.from(str.map((x) => Carrera.fromJson(x)));
}

Carrera carreraFromJson(dynamic str){
  Map<String, dynamic> data = str;
  return Carrera.fromJson(data);
}

String carrerasToJson(List<Carrera> data) {
  return json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}

String carreraToJson(Carrera data) {
  return json.encode(data.toJson());
}

class Carrera {
    int id;
    String nombre;

    Carrera({
        required this.id,
        required this.nombre,
    });

    Carrera copyWith({
        int? id,
        String? nombre,
    }) => 
        Carrera(
            id: id ?? this.id,
            nombre: nombre ?? this.nombre,
        );

    factory Carrera.fromJson(Map<String, dynamic> json) => Carrera(
        id: json["id"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
    };
}
