import 'dart:convert';

List<Autor> autoresFromJson(dynamic data) {
  List<dynamic> str = data;
  return List<Autor>.from(str.map((x) => Autor.fromJson(x)));
}

Autor autorFromJson(dynamic str){
  Map<String, dynamic> data = str;
  return Autor.fromJson(data);
}

String autoresToJson(List<Autor> data) {
  return json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}

String autorToJson(Autor data) {
  return json.encode(data.toJson());
}

class Autor {
    int id;
    String nombre;
    DateTime fechaNacimiento;
    String nacionalidad;
    String biografia;

    Autor({
        required this.id,
        required this.nombre,
        required this.fechaNacimiento,
        required this.nacionalidad,
        required this.biografia,
    });

    Autor copyWith({
        int? id,
        String? nombre,
        DateTime? fechaNacimiento,
        String? nacionalidad,
        String? biografia,
    }) => 
        Autor(
            id: id ?? this.id,
            nombre: nombre ?? this.nombre,
            fechaNacimiento: fechaNacimiento ?? this.fechaNacimiento,
            nacionalidad: nacionalidad ?? this.nacionalidad,
            biografia: biografia ?? this.biografia,
        );

    factory Autor.fromJson(Map<String, dynamic> json) => Autor(
        id: json["id"],
        nombre: json["nombre"],
        fechaNacimiento: DateTime.parse(json["fechaNacimiento"]),
        nacionalidad: json["nacionalidad"],
        biografia: json["biografia"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "fechaNacimiento": "${fechaNacimiento.year.toString().padLeft(4, '0')}-${fechaNacimiento.month.toString().padLeft(2, '0')}-${fechaNacimiento.day.toString().padLeft(2, '0')}",
        "nacionalidad": nacionalidad,
        "biografia": biografia,
    };
}
