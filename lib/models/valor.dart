import 'dart:convert';

List<Valor> valoresFromJson(dynamic data) {
  List<dynamic> str = data;
  return List<Valor>.from(str.map((x) => Valor.fromJson(x)));
}

Valor valorFromJson(dynamic str) {
  Map<String, dynamic> data = str;
  return Valor.fromJson(data);
}

String valorToJson(Valor data) {
  return json.encode(data.toJson());
}

String valoresToJson(List<Valor> data) {
  return json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}

class Valor {
    int id;
    String nombre;

    Valor({
        required this.id,
        required this.nombre,
    });

    Valor copyWith({
        int? id,
        String? nombre,
    }) => 
        Valor(
            id: id ?? this.id,
            nombre: nombre ?? this.nombre,
        );

    factory Valor.fromJson(Map<String, dynamic> json) => Valor(
        id: json["id"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
    };
}
