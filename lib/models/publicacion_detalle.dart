
// To parse this JSON data, do
//
//     final publicacionDetalle = publicacionDetalleFromJson(jsonString);

import 'dart:convert';

import 'package:bibliotech_admin/models/autor.dart';
import 'package:bibliotech_admin/models/categoria.dart';
import 'package:bibliotech_admin/models/tipos_publicacion.dart';

import 'ediciones.dart';
import 'editoriales.dart';

PublicacionDetalle publicacionDetalleFromJson(dynamic data) {
  Map<String, dynamic> str = data;
  return PublicacionDetalle.fromJson(str);
}

String publicacionDetalleToJson(PublicacionDetalle data) => json.encode(data.toJson());

class PublicacionDetalle {
    final int? anio;
    final List<Autor>? autores;
    final List<Categoria>? categorias;
    final Edicion? edicion;
    final List<Editorial>? editoriales;
    final int? isbn;
    final TipoPublicacion? tipo;
    final String? titulo;

    PublicacionDetalle({
        this.anio,
        this.autores,
        this.categorias,
        this.edicion,
        this.editoriales,
        this.isbn,
        this.tipo,
        this.titulo,
    });

    PublicacionDetalle copyWith({
        int? anio,
        List<Autor>? autores,
        List<Categoria>? categorias,
        Edicion? edicion,
        List<Editorial>? editoriales,
        int? isbn,
        TipoPublicacion? tipo,
        String? titulo,
    }) => 
        PublicacionDetalle(
            anio: anio ?? this.anio,
            autores: autores ?? this.autores,
            categorias: categorias ?? this.categorias,
            edicion: edicion ?? this.edicion,
            editoriales: editoriales ?? this.editoriales,
            isbn: isbn ?? this.isbn,
            tipo: tipo ?? this.tipo,
            titulo: titulo ?? this.titulo,
        );

    factory PublicacionDetalle.fromJson(Map<String, dynamic> json) => PublicacionDetalle(
        anio: json["anio"],
        autores: json["autores"] == null ? [] : List<Autor>.from(json["autores"]!.map((x) => Autor.fromJson(x))),
        categorias: json["categorias"] == null ? [] : List<Categoria>.from(json["categorias"]!.map((x) => Categoria.fromJson(x))),
        edicion: json["edicion"] == null ? null : Edicion.fromJson(json["edicion"]),
        editoriales: json["editoriales"] == null ? [] : List<Editorial>.from(json["editoriales"]!.map((x) => Editorial.fromJson(x))),
        isbn: json["isbn"],
        tipo: json["tipo"] == null ? null : TipoPublicacion.fromJson(json["tipo"]),
        titulo: json["titulo"],
    );

    Map<String, dynamic> toJson() => {
        "anio": anio,
        "autores": autores == null ? [] : List<dynamic>.from(autores!.map((x) => x.toJson())),
        "categorias": categorias == null ? [] : List<dynamic>.from(categorias!.map((x) => x.toJson())),
        "edicion": edicion?.toJson(),
        "editoriales": editoriales == null ? [] : List<dynamic>.from(editoriales!.map((x) => x.toJson())),
        "isbn": isbn,
        "tipo": tipo?.toJson(),
        "titulo": titulo,
    };
}
