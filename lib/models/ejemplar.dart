import 'dart:convert';

import 'package:bibliotech_admin/models/index.dart';

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
    double valoracion;
    List<Comentario> comentarios;
    List<EjemplarEstado> estados;
    Ubicacion? ubicacion;

    Ejemplar({
        required this.id,
        required this.serialNfc,
        required this.valoracion,
        required this.comentarios,
        required this.estados,
        required this.ubicacion,
    });

    Ejemplar copyWith({
        int? id,
        int? serialNfc,
        double? valoracion,
        List<Comentario>? comentarios,
        List<EjemplarEstado>? estados,
        Ubicacion? ubicacion,
    }) => 
        Ejemplar(
            id: id ?? this.id,
            serialNfc: serialNfc ?? this.serialNfc,
            valoracion: valoracion ?? this.valoracion,
            comentarios: comentarios ?? this.comentarios,
            estados: estados ?? this.estados,
            ubicacion: ubicacion ?? this.ubicacion,
        );

    factory Ejemplar.fromJson(Map<String, dynamic> json) => Ejemplar(
        id: json["id"],
        serialNfc: json["serialNFC"],
        valoracion: json["valoracion"],
        comentarios: List<Comentario>.from(json["comentarios"].map((x) => Comentario.fromJson(x))),
        estados: List<EjemplarEstado>.from(json["estados"].map((x) => EjemplarEstado.fromJson(x))),
        ubicacion: json["ubicacion"].isNull ? null : Ubicacion.fromJson(json["ubicacion"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "serialNFC": serialNfc,
        "valoracion": valoracion,
        "comentarios": List<dynamic>.from(comentarios.map((x) => x.toJson())),
        "estados": List<dynamic>.from(estados.map((x) => x.toJson())),
        "ubicacion": ubicacion,
    };
}