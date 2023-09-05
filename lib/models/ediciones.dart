
import 'dart:convert';

List<Edicion> edicionFromJson(dynamic data){
  List<dynamic> str = data;
  return List<Edicion>.from(str.map((x) => Edicion.fromJson(x)));
}

String edicionToJson(List<Edicion> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Edicion {
    final int id;
    final String titulo;

    Edicion({
        required this.id,
        required this.titulo,
    });

    Edicion copyWith({
        int? id,
        String? titulo,
    }) => 
        Edicion(
            id: id ?? this.id,
            titulo: titulo ?? this.titulo,
        );

    factory Edicion.fromJson(Map<String, dynamic> json) => Edicion(
        id: json["id"],
        titulo: json["titulo"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "titulo": titulo,
    };
}
