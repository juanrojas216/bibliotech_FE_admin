
CreateUsuarioDto publicacionFromJson(dynamic str) {
  Map<String, dynamic> data = str;
  return CreateUsuarioDto.fromJson(data);
}

class CreateUsuarioDto {
  String? nombre;
  String? apellido;
  String? password;
  String? email;
  List<int> roles;

  CreateUsuarioDto({
    required this.nombre,
    required this.apellido,
    required this.password,
    required this.email,
    required this.roles,
  });

  factory CreateUsuarioDto.fromJson(Map<String, dynamic> json) =>
      CreateUsuarioDto(
        nombre: json["nombre"],
        apellido: json["apellido"],
        password: json["password"],
        email: json["email"],
        roles: List<int>.from(json["roles"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "firstName": nombre,
        "lastName": apellido,
        "email": email,
        "password": password,
        "roleIds": List<dynamic>.from(roles.map((x) => x)),
    };
}
