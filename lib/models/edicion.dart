import 'dart:convert';

List<Edicion> edicionesFromJson(dynamic data) {
  List<dynamic> str = data;
  return List<Edicion>.from(str.map((x) => Edicion.fromJson(x)));
}

Edicion edicionFromJson(dynamic str) {
  Map<String, dynamic> data = str;
  return Edicion.fromJson(data);
}

String edicionToJson(Edicion data) {
  return json.encode(data.toJson());
}

String edicionesToJson(List<Edicion> data) {
  return json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}

class Edicion {
    int id;
    String nombre;

    Edicion({
        required this.id,
        required this.nombre,
    });

    Edicion copyWith({
        int? id,
        String? nombre,
    }) => 
        Edicion(
            id: id ?? this.id,
            nombre: nombre ?? this.nombre,
        );

    factory Edicion.fromJson(Map<String, dynamic> json) => Edicion(
        id: json["id"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
    };
}
