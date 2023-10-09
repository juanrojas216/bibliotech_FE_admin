import 'dart:convert';

List<Ubicacion> ubicacionesFromJson(dynamic data) {
  List<dynamic> str = data;
  return List<Ubicacion>.from(str.map((x) => Ubicacion.fromJson(x)));
}

Ubicacion ubicacionFromJson(dynamic str){
  Map<String, dynamic> data = str;
  return Ubicacion.fromJson(data);
}

String ubicaionesToJson(List<Ubicacion> data) {
  return json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}

String ubicacionToJson(Ubicacion data) {
  return json.encode(data.toJson());
}
class Ubicacion {
    int id;
    String descripcion;
    bool ocupada;

    Ubicacion({
        required this.id,
        required this.descripcion,
        required this.ocupada,
    });

    Ubicacion copyWith({
        int? id,
        String? descripcion,
        bool? ocupada,
    }) => 
        Ubicacion(
            id: id ?? this.id,
            descripcion: descripcion ?? this.descripcion,
            ocupada: ocupada ?? this.ocupada,
        );

    factory Ubicacion.fromJson(Map<String, dynamic> json) => Ubicacion(
        id: json["id"],
        descripcion: json["descripcion"],
        ocupada: json["ocupada"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "descripcion": descripcion,
        "ocupada": ocupada,
    };
}
