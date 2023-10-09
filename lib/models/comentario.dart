import 'dart:convert';

import 'usuario.dart';

List<Comentario> comentariosFromJson(dynamic data) {
  List<dynamic> str = data;
  return List<Comentario>.from(str.map((x) => Comentario.fromJson(x)));
}

Comentario comentarioFromJson(dynamic str) {
  Map<String, dynamic> data = str;
  return Comentario.fromJson(data);
}

String comentarioToJson(Comentario data) {
  return json.encode(data.toJson());
}

String comentariosToJson(List<Comentario> data) {
  return json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}

class Comentario {
    int id;
    int calificacion;
    String comentario;
    String fecha;
    Usuario altaUsuario;
    Usuario? bajaUsuario;

    Comentario({
        required this.id,
        required this.calificacion,
        required this.comentario,
        required this.fecha,
        required this.altaUsuario,
        required this.bajaUsuario,
    });

    Comentario copyWith({
        int? id,
        int? calificacion,
        String? comentario,
        String? fecha,
        Usuario? altaUsuario,
        Usuario? bajaUsuario,
    }) => 
        Comentario(
            id: id ?? this.id,
            calificacion: calificacion ?? this.calificacion,
            comentario: comentario ?? this.comentario,
            fecha: fecha ?? this.fecha,
            altaUsuario: altaUsuario ?? this.altaUsuario,
            bajaUsuario: bajaUsuario ?? this.bajaUsuario,
        );

    factory Comentario.fromJson(Map<String, dynamic> json) => Comentario(
        id: json["id"],
        calificacion: json["calificacion"],
        comentario: json["comentario"],
        fecha: json["fecha"],
        altaUsuario: Usuario.fromJson(json["altaUsuario"]),
        bajaUsuario: json["bajaUsuario"]  == null ? null : Usuario.fromJson(json["altaUsuario"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "calificacion": calificacion,
        "comentario": comentario,
        "fecha": fecha,
        "altaUsuario": altaUsuario.toJson(),
        "bajaUsuario": bajaUsuario?.toJson(),
    };
}