import 'dart:convert';

import 'autor.dart';
import 'categoria_publicacion.dart';
import 'comentario.dart';
import 'edicion.dart';
import 'editorial.dart';
import 'ejemplar.dart';
import 'link.dart';
import 'tipo_publicacion.dart';

List<Publicacion> publicacionesFromJson(dynamic data) {
  List<dynamic> str = data;
  return List<Publicacion>.from(str.map((x) => Publicacion.fromJson(x)));
}

Publicacion publicacionFromJson(dynamic str) {
  Map<String, dynamic> data = str;
  return Publicacion.fromJson(data);
}

String publicacionToJson(Publicacion data) {
  return json.encode(data.toJson());
}

String publicacionesToJson(List<Publicacion> data) {
  return json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}

class Publicacion {
    int id;
    int anioPublicacion;
    String isbnPublicacion;
    String tituloPublicacion;
    int nroPaginas;
    List<Autor> autores;
    Edicion edicion;
    Link link;
    List<CategoriaPublicacion> categorias;
    TipoPublicacion tipo;
    List<Editorial> editoriales;
    // List<Comentario> comentarios;
    // List<Ejemplar> ejemplares;

    Publicacion({
        required this.id,
        required this.anioPublicacion,
        required this.isbnPublicacion,
        required this.tituloPublicacion,
        required this.nroPaginas,
        required this.autores,
        required this.edicion,
        required this.link,
        required this.categorias,
        required this.tipo,
        required this.editoriales,
        // required this.comentarios,
        // required this.ejemplares,
    });

    Publicacion copyWith({
        int? id,
        int? anioPublicacion,
        String? isbnPublicacion,
        String? tituloPublicacion,
        int? nroPaginas,
        List<Autor>? autores,
        Edicion? edicion,
        Link? link,
        List<CategoriaPublicacion>? categorias,
        TipoPublicacion? tipo,
        List<Editorial>? editoriales,
        List<Comentario>? comentarios,
        List<Ejemplar>? ejemplares,
    }) => 
        Publicacion(
            id: id ?? this.id,
            anioPublicacion: anioPublicacion ?? this.anioPublicacion,
            isbnPublicacion: isbnPublicacion ?? this.isbnPublicacion,
            tituloPublicacion: tituloPublicacion ?? this.tituloPublicacion,
            nroPaginas: nroPaginas ?? this.nroPaginas,
            autores: autores ?? this.autores,
            edicion: edicion ?? this.edicion,
            link: link ?? this.link,
            categorias: categorias ?? this.categorias,
            tipo: tipo ?? this.tipo,
            editoriales: editoriales ?? this.editoriales,
            // comentarios: comentarios ?? this.comentarios,
            // ejemplares: ejemplares ?? this.ejemplares,
        );

    factory Publicacion.fromJson(Map<String, dynamic> json) => Publicacion(
        id: json["id"],
        anioPublicacion: json["anioPublicacion"],
        isbnPublicacion: json["ISBNPublicacion"],
        tituloPublicacion: json["tituloPublicacion"],
        nroPaginas: json["nroPaginas"],
        autores: List<Autor>.from(json["autores"].map((x) => Autor.fromJson(x))),
        edicion: Edicion.fromJson(json["edicion"]),
        link: json["link"] == null ? Link(url: null, estado: null, plataforma: null) : Link.fromJson(json["link"]),
        categorias: List<CategoriaPublicacion>.from(json["categorias"].map((x) => CategoriaPublicacion.fromJson(x))),
        tipo: TipoPublicacion.fromJson(json["tipo"]),
        editoriales: List<Editorial>.from(json["editoriales"].map((x) => Editorial.fromJson(x))),
        // comentarios: [],//List<Comentario>.from(json["comentarios"].map((x) => Comentario.fromJson(x))),
        // ejemplares: [],//List<Ejemplar>.from(json["ejemplares"].map((x) => Ejemplar.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "anioPublicacion": anioPublicacion,
        "ISBNPublicacion": isbnPublicacion,
        "tituloPublicacion": tituloPublicacion,
        "nroPaginas": nroPaginas,
        "autores": List<dynamic>.from(autores.map((x) => x.toJson())),
        "edicion": edicion.toJson(),
        "link": link.toJson() ,
        "categorias": List<dynamic>.from(categorias.map((x) => x.toJson())),
        "tipo": tipo.toJson(),
        "editoriales": List<dynamic>.from(editoriales.map((e) => e.toJson())),
        // "comentarios": List<dynamic>.from(comentarios.map((x) => x.toJson())),
        // "ejemplares": List<dynamic>.from(ejemplares.map((x) => x.toJson())),
    };
}
