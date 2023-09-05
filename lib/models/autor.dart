

import 'dart:convert';

List<Autor> autorFromJson(dynamic data){
  List<dynamic> str = data;
  return List<Autor>.from(str.map((x) => Autor.fromJson(x)));
}

String autorToJson(List<Autor> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Autor {
    final int id;
    final String nombre;

    Autor({
        required this.id,
        required this.nombre,
    });

    Autor copyWith({
        int? id,
        String? nombre,
    }) => 
        Autor(
            id: id ?? this.id,
            nombre: nombre ?? this.nombre,
        );

    factory Autor.fromJson(Map<String, dynamic> json) => Autor(
        id: json["id"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
    };
}
