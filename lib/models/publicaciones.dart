// To parse this JSON data, do
//
//     final publicacion = publicacionFromJson(jsonString);

import 'dart:convert';

List<Publicacion> publicacionFromJson(dynamic data) {
  List<dynamic> str = data;
  return List<Publicacion>.from(str.map((x) => Publicacion.fromJson(x)));
}

String publicacionToJson(List<Publicacion> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Publicacion {
    final int? anio;
    final List<String>? autores;
    final String? edicion;
    final List<String>? editoriales;
    final String? titulo;

    Publicacion({
        this.anio,
        this.autores,
        this.edicion,
        this.editoriales,
        this.titulo,
    });

    Publicacion copyWith({
        int? anio,
        List<String>? autores,
        String? edicion,
        List<String>? editoriales,
        String? titulo,
    }) => 
        Publicacion(
            anio: anio ?? this.anio,
            autores: autores ?? this.autores,
            edicion: edicion ?? this.edicion,
            editoriales: editoriales ?? this.editoriales,
            titulo: titulo ?? this.titulo,
        );

    factory Publicacion.fromJson(Map<String, dynamic> json) => Publicacion(
        anio: json["anio"],
        autores: json["autores"] == null ? [] : List<String>.from(json["autores"]!.map((x) => x)),
        edicion: json["edicion"],
        editoriales: json["editoriales"] == null ? [] : List<String>.from(json["editoriales"]!.map((x) => x)),
        titulo: json["titulo"],
    );

    Map<String, dynamic> toJson() => {
        "anio": anio,
        "autores": autores == null ? [] : List<dynamic>.from(autores!.map((x) => x)),
        "edicion": edicion,
        "editoriales": editoriales == null ? [] : List<dynamic>.from(editoriales!.map((x) => x)),
        "titulo": titulo,
    };
}
