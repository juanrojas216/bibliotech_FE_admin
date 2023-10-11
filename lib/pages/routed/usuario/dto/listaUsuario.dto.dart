List<ListaUsuarioDto> usuariosFromJson(dynamic data) {
  List<dynamic> str = data;
  return List<ListaUsuarioDto>.from(
      str.map((x) => ListaUsuarioDto.fromJson(x)));
}

class ListaUsuarioDto {
  final int id;
  final String nombre;
  final List<String> roles;

  ListaUsuarioDto({
    required this.id,
    required this.nombre,
    required this.roles,
  });

  factory ListaUsuarioDto.fromJson(Map<String, dynamic> json) =>
      ListaUsuarioDto(
        id: json["id"],
        nombre: json["nombre"],
        roles: List<String>.from(json["roles"].map((x) => x)),
      );
}
