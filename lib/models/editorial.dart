import 'dart:convert';

List<Editorial> editorialesFromJson(dynamic data) {
  List<dynamic> str = data;
  return List<Editorial>.from(str.map((x) => Editorial.fromJson(x)));
}

Editorial editorialFromJson(dynamic str){
  Map<String, dynamic> data = str;
  return Editorial.fromJson(data);
}

String editorialesToJson(List<Editorial> data) {
  return json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}

String editorialToJson(Editorial data) {
  return json.encode(data.toJson());
}

class Editorial {
    int id;
    String nombre;

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
