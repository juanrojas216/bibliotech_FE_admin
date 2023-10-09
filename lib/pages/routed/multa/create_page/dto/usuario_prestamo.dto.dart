
List<PrestamoMultaDto> usuariosFromJson(dynamic data) {
  List<dynamic> str = data;
  return List<PrestamoMultaDto>.from(str.map((x) => PrestamoMultaDto.fromJson(x)));
}


class PrestamoMultaDto {
    bool value = false;
    int id;
    String publicacion;
    String ejemplar;
    String estado;
    String fechaInicio;

    PrestamoMultaDto({
        required this.id,
        required this.publicacion,
        required this.ejemplar,
        required this.estado,
        required this.fechaInicio,
    });

    PrestamoMultaDto copyWith({
        int? id,
        String? publicacion,
        String? ejemplar,
        String? estado,
        String? fechaInicio,
    }) => 
        PrestamoMultaDto(
            id: id ?? this.id,
            publicacion: publicacion ?? this.publicacion,
            ejemplar: ejemplar ?? this.ejemplar,
            estado: estado ?? this.estado,
            fechaInicio: fechaInicio ?? this.fechaInicio,
        );

    factory PrestamoMultaDto.fromJson(Map<String, dynamic> json) => PrestamoMultaDto(
        id: json["id"],
        publicacion: json["publicacion"],
        ejemplar: json["ejemplar"],
        estado: json["estado"],
        fechaInicio: json["fechaInicio"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "publicacion": publicacion,
        "ejemplar": ejemplar,
        "estado": estado,
        "fechaInicio": fechaInicio,
    };
}
