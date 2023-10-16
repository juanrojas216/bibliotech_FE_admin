DetalleUsuarioDto detalleUsuarioFromJson(dynamic str) {
  Map<String, dynamic> data = str;
  return DetalleUsuarioDto.fromJson(data);
}

class DetalleUsuarioDto {
  final int? id;
  late String? nombre;
  late String? apellido;
  late String? email;
  late String? password;
  List<String> roles;

  DetalleUsuarioDto({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.email,
    required this.password,
    required this.roles,
  });

  factory DetalleUsuarioDto.fromJson(Map<String, dynamic> json) =>
      DetalleUsuarioDto(
        id: json["id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        email: json["email"],
        password: json["password"],
        roles: List<String>.from(json["roles"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
        "apellido": apellido,
        "email": email,
        "password": password,
        "roles": List<dynamic>.from(roles.map((x) => x)),
    };
}
