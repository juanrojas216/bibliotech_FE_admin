import 'dart:convert';

List<TipoPublicacion> tiposPublicacionesFromJson(dynamic data) {
  List<dynamic> str = data;
  return List<TipoPublicacion>.from(str.map((x) => TipoPublicacion.fromJson(x)));
}

TipoPublicacion tipoPublicacionFromJson(dynamic str){
  Map<String, dynamic> data = str;
  return TipoPublicacion.fromJson(data);
}

String tiposPublicacionesToJson(List<TipoPublicacion> data) {
  return json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}

String tipoPublicacionToJson(TipoPublicacion data) {
  return json.encode(data.toJson());
}

class TipoPublicacion {
    int id;
    String nombre;

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
