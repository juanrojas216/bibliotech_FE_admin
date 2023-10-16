
List<UsuarioPrestamoDto> usuariosFromJson(dynamic data) {
  List<dynamic> str = data;
  return List<UsuarioPrestamoDto>.from(str.map((x) => UsuarioPrestamoDto.fromJson(x)));
}


class UsuarioPrestamoDto {
    bool value = false;
    int id;
    String dni;
    String legajo;
    String nombre;
    String apellido;

    UsuarioPrestamoDto({
        required this.id,
        required this.dni,
        required this.legajo,
        required this.nombre,
        required this.apellido,
    });

    UsuarioPrestamoDto copyWith({
        int? id,
        String? dni,
        String? legajo,
        String? nombre,
        String? apellido,
    }) => 
        UsuarioPrestamoDto(
            id: id ?? this.id,
            dni: dni ?? this.dni,
            legajo: legajo ?? this.legajo,
            nombre: nombre ?? this.nombre,
            apellido: apellido ?? this.apellido,
        );

    factory UsuarioPrestamoDto.fromJson(Map<String, dynamic> json) => UsuarioPrestamoDto(
        id: json["id"],
        dni: json["dni"],
        legajo: json["legajo"],
        nombre: json["nombre"],
        apellido: json["apellido"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "dni": dni,
        "legajo": legajo,
        "nombre": nombre,
        "apellido": apellido,
    };
}
