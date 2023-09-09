import 'dart:convert';

import 'valor.dart';

List<Categoria> categoriasFromJson(dynamic data) {
  List<dynamic> str = data;
  return List<Categoria>.from(str.map((x) => Categoria.fromJson(x)));
}

Categoria categoriaFromJson(dynamic str) {
  Map<String, dynamic> data = str;
  return Categoria.fromJson(data);
}

String categoriaToJson(Categoria data) {
  return json.encode(data.toJson());
}

String categoriasToJson(List<Categoria> data) {
  return json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}

class Categoria {
    int id;
    String nombre;
    List<Valor> valores;

    Categoria({
        required this.id,
        required this.nombre,
        required this.valores,
    });

    Categoria copyWith({
        int? id,
        String? nombre,
        List<Valor>? valores,
    }) => 
        Categoria(
            id: id ?? this.id,
            nombre: nombre ?? this.nombre,
            valores: valores ?? this.valores,
        );

    factory Categoria.fromJson(Map<String, dynamic> json) => Categoria(
        id: json["id"],
        nombre: json["nombre"],
        valores: List<Valor>.from(json["valores"].map((x) => Valor.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "valores": List<dynamic>.from(valores.map((x) => x.toJson())),
    };
}