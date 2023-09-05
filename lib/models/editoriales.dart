
import 'dart:convert';

List<Editorial> editorialFromJson(dynamic data) {
  List<dynamic> str = data;
  return List<Editorial>.from(str.map((x) => Editorial.fromJson(x)));
}

String editorialToJson(List<Editorial> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Editorial {
    final int id;
    final String nombre;

    Editorial({
        required this.id,
        required this.nombre,
    });

    Editorial copyWith({
        int? id,
        String? nombre,
    }) => 
        Editorial(
            id: id ?? this.id,
            nombre: nombre ?? this.nombre,
        );

    factory Editorial.fromJson(Map<String, dynamic> json) => Editorial(
        id: json["id"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
    };
}
