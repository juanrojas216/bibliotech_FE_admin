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
    String url;
    String instrucciones;

    Plataforma({
        required this.id,
        required this.nombre,
        required this.url,
        required this.instrucciones,
    });

    Plataforma copyWith({
        int? id,
        String? nombre,
        String? url,
        String? instrucciones,
    }) => 
        Plataforma(
            id: id ?? this.id,
            nombre: nombre ?? this.nombre,
            url: url ?? this.url,
            instrucciones: instrucciones ?? this.instrucciones,
        );

    factory Plataforma.fromJson(Map<String, dynamic> json) => Plataforma(
        id: json["id"],
        nombre: json["nombre"],
        url: json["url"],
        instrucciones: json["instrucciones"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "url": url,
        "instrucciones": instrucciones,
    };
}
