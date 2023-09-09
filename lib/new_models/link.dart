import 'dart:convert';

import 'plataforma.dart';

List<Link> linksFromJson(dynamic data) {
  List<dynamic> str = data;
  return List<Link>.from(str.map((x) => Link.fromJson(x)));
}

Link linkFromJson(dynamic str){
  Map<String, dynamic> data = str;
  return Link.fromJson(data);
}

String linksToJson(List<Link> data) {
  return json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}

String linkToJson(Link data) {
  return json.encode(data.toJson());
}

class Link {
    int id;
    String url;
    String estado;
    Plataforma plataforma;

    Link({
        required this.id,
        required this.url,
        required this.estado,
        required this.plataforma,
    });

    Link copyWith({
        int? id,
        String? url,
        String? estado,
        Plataforma? plataforma,
    }) => 
        Link(
            id: id ?? this.id,
            url: url ?? this.url,
            estado: estado ?? this.estado,
            plataforma: plataforma ?? this.plataforma,
        );

    factory Link.fromJson(Map<String, dynamic> json) => Link(
        id: json["id"],
        url: json["url"],
        estado: json["estado"],
        plataforma: Plataforma.fromJson(json["plataforma"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "estado": estado,
        "plataforma": plataforma.toJson(),
    };
}