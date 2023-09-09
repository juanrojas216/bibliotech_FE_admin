import 'dart:convert';

List<Usuario> usuariosFromJson(dynamic data) {
  List<dynamic> str = data;
  return List<Usuario>.from(str.map((x) => Usuario.fromJson(x)));
}

Usuario usuarioFromJson(dynamic str) {
  Map<String, dynamic> data = str;
  return Usuario.fromJson(data);
}

String usuarioToJson(Usuario data) {
  return json.encode(data.toJson());
}

String usuariosToJson(List<Usuario> data) {
  return json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}

class Usuario {
    int id;
    String dni;
    String legajo;
    String nombre;
    String apellido;
    String mail;
    String telefono;
    String domicilio;
    String localidad;
    String provincia;

    Usuario({
        required this.id,
        required this.dni,
        required this.legajo,
        required this.nombre,
        required this.apellido,
        required this.mail,
        required this.telefono,
        required this.domicilio,
        required this.localidad,
        required this.provincia,
    });

    Usuario copyWith({
        int? id,
        String? dni,
        String? legajo,
        String? nombre,
        String? apellido,
        String? mail,
        String? telefono,
        String? domicilio,
        String? localidad,
        String? provincia,
    }) => 
        Usuario(
            id: id ?? this.id,
            dni: dni ?? this.dni,
            legajo: legajo ?? this.legajo,
            nombre: nombre ?? this.nombre,
            apellido: apellido ?? this.apellido,
            mail: mail ?? this.mail,
            telefono: telefono ?? this.telefono,
            domicilio: domicilio ?? this.domicilio,
            localidad: localidad ?? this.localidad,
            provincia: provincia ?? this.provincia,
        );

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        dni: json["dni"],
        legajo: json["legajo"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        mail: json["mail"],
        telefono: json["telefono"],
        domicilio: json["domicilio"],
        localidad: json["localidad"],
        provincia: json["provincia"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "dni": dni,
        "legajo": legajo,
        "nombre": nombre,
        "apellido": apellido,
        "mail": mail,
        "telefono": telefono,
        "domicilio": domicilio,
        "localidad": localidad,
        "provincia": provincia,
    };
}
