
List<UsuarioMultaDto> usuariosFromJson(dynamic data) {
  List<dynamic> str = data;
  return List<UsuarioMultaDto>.from(str.map((x) => UsuarioMultaDto.fromJson(x)));
}


class UsuarioMultaDto {
    bool value = false;
    int id;
    String dni;
    String legajo;
    String nombre;
    String apellido;

    UsuarioMultaDto({
        required this.id,
        required this.dni,
        required this.legajo,
        required this.nombre,
        required this.apellido,
    });

    UsuarioMultaDto copyWith({
        int? id,
        String? dni,
        String? legajo,
        String? nombre,
        String? apellido,
    }) => 
        UsuarioMultaDto(
            id: id ?? this.id,
            dni: dni ?? this.dni,
            legajo: legajo ?? this.legajo,
            nombre: nombre ?? this.nombre,
            apellido: apellido ?? this.apellido,
        );

    factory UsuarioMultaDto.fromJson(Map<String, dynamic> json) => UsuarioMultaDto(
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
