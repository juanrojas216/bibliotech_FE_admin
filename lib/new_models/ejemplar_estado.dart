import 'dart:convert';

import 'usuario.dart';

List<EjemplarEstado> ejemplaresEstadosFromJson(dynamic data) {
  List<dynamic> str = data;
  return List<EjemplarEstado>.from(str.map((x) => EjemplarEstado.fromJson(x)));
}

EjemplarEstado ejemplarEstadoFromJson(dynamic str) {
  Map<String, dynamic> data = str;
  return EjemplarEstado.fromJson(data);
}

String ejemplarEstadoToJson(EjemplarEstado data) {
  return json.encode(data.toJson());
}

String ejemplaresEstadosToJson(List<EjemplarEstado> data) {
  return json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}

class EjemplarEstado {
    int id;
    String nombre;
    Usuario usuario;

    EjemplarEstado({
        required this.id,
        required this.nombre,
        required this.usuario,
    });

    EjemplarEstado copyWith({
        int? id,
        String? nombre,
        Usuario? usuario,
    }) => 
        EjemplarEstado(
            id: id ?? this.id,
            nombre: nombre ?? this.nombre,
            usuario: usuario ?? this.usuario,
        );

    factory EjemplarEstado.fromJson(Map<String, dynamic> json) => EjemplarEstado(
        id: json["id"],
        nombre: json["nombre"],
        usuario: Usuario.fromJson(json["usuario"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "usuario": usuario.toJson(),
    };
}
