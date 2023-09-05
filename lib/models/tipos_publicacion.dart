

import 'dart:convert';

List<TipoPublicacion> tipoPublicacionFromJson(dynamic data){
  List<dynamic> str = data;
  return List<TipoPublicacion>.from(str.map((x) => TipoPublicacion.fromJson(x)));
}

String tipoPublicacionToJson(List<TipoPublicacion> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TipoPublicacion {
    final int id;
    final String nombre;

    TipoPublicacion({
        required this.id,
        required this.nombre,
    });

    TipoPublicacion copyWith({
        int? id,
        String? nombre,
    }) => 
        TipoPublicacion(
            id: id ?? this.id,
            nombre: nombre ?? this.nombre,
        );

    factory TipoPublicacion.fromJson(Map<String, dynamic> json) => TipoPublicacion(
        id: json["id"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
    };
}
