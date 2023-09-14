import 'dart:convert';

import 'package:bibliotech_admin/new_models/comentario.dart';

List<Ejemplar> ejemplaresFromJson(dynamic data) {
  List<dynamic> str = data;
  return List<Ejemplar>.from(str.map((x) => Ejemplar.fromJson(x)));
}

Ejemplar ejemplarFromJson(dynamic str) {
  Map<String, dynamic> data = str;
  return Ejemplar.fromJson(data);
}

String ejemplarToJson(Ejemplar data) {
  return json.encode(data.toJson());
}

String ejemplaresToJson(List<Ejemplar> data) {
  return json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}

class Ejemplar {
    int id;
    int serialNfc;
    List<Comentario> comentarios;
    List<dynamic> estados;
    String ubicacion;

    Ejemplar({
        required this.id,
        required this.serialNfc,
        required this.comentarios,
        required this.estados,
        required this.ubicacion,
    });

    Ejemplar copyWith({
        int? id,
        int? serialNfc,
        List<Comentario>? comentarios,
        List<dynamic>? estados,
        String? ubicacion,
    }) => 
        Ejemplar(
            id: id ?? this.id,
            serialNfc: serialNfc ?? this.serialNfc,
            comentarios: comentarios ?? this.comentarios,
            estados: estados ?? this.estados,
            ubicacion: ubicacion ?? this.ubicacion,
        );

    factory Ejemplar.fromJson(Map<String, dynamic> json) => Ejemplar(
        id: json["id"],
        serialNfc: json["serialNFC"],
        comentarios: List<Comentario>.from(json["comentarios"].map((x) => x)),
        estados: List<dynamic>.from(json["estados"].map((x) => x)),
        ubicacion: json["ubicacion"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "serialNFC": serialNfc,
        "comentarios": List<dynamic>.from(comentarios.map((x) => x)),
        "estados": List<dynamic>.from(estados.map((x) => x)),
        "ubicacion": ubicacion,
    };
}