// To parse this JSON data, do
//
//     final carrera = carreraFromJson(jsonString);

import 'dart:convert';

List<Facultad> facultadesFromJson(dynamic data) {
  List<dynamic> str = data;
  return List<Facultad>.from(str.map((x) => Facultad.fromJson(x)));
}

Facultad facultadFromJson(dynamic str){
  Map<String, dynamic> data = str;
  return Facultad.fromJson(data);
}

String facultadesToJson(List<Facultad> data) {
  return json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}

String facultadToJson(Facultad data) {
  return json.encode(data.toJson());
}

class Facultad {
    int id;
    String nombre;

    Facultad({
        required this.id,
        required this.nombre,
    });

    Facultad copyWith({
        int? id,
        String? nombre,
    }) => 
        Facultad(
            id: id ?? this.id,
            nombre: nombre ?? this.nombre,
        );

    factory Facultad.fromJson(Map<String, dynamic> json) => Facultad(
        id: json["id"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
    };
}
