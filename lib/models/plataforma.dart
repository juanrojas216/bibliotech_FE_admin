import 'dart:convert';

List<Plataforma> plataformasFromJson(dynamic data) {
  List<dynamic> str = data;
  return List<Plataforma>.from(str.map((x) => Plataforma.fromJson(x)));
}

Plataforma plataformaFromJson(dynamic str){
  Map<String, dynamic> data = str;
  return Plataforma.fromJson(data);
}

String plataformasToJson(List<Plataforma> data) {
  return json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}

String plataformaToJson(Plataforma data) {
  return json.encode(data.toJson());
}

class Plataforma {
    int id;
    String nombre;
    String instrucciones;

    Plataforma({
        required this.id,
        required this.nombre,
        required this.instrucciones,
    });

    Plataforma copyWith({
        int? id,
        String? nombre,
        // String? url,
        String? instrucciones,
    }) => 
        Plataforma(
            id: id ?? this.id,
            nombre: nombre ?? this.nombre,
            instrucciones: instrucciones ?? this.instrucciones,
        );

    factory Plataforma.fromJson(Map<String, dynamic> json) => Plataforma(
        id: json["id"],
        nombre: json["nombre"],
        instrucciones: json["instrucciones"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "instrucciones": instrucciones,
    };
}
