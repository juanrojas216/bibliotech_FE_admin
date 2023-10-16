


List<MotivoMultaDto> motivosFromJson(dynamic data) {
  List<dynamic> str = data;
  return List<MotivoMultaDto>.from(str.map((x) => MotivoMultaDto.fromJson(x)));
}


class MotivoMultaDto {
    int id;
    String nombre;
    int dias;

    MotivoMultaDto({
        required this.id,
        required this.nombre,
        required this.dias,

    });

    MotivoMultaDto copyWith({
        int? id,
        String? nombre,
        int? dias,
    }) => 
        MotivoMultaDto(
            id: id ?? this.id,
            nombre: nombre ?? this.nombre,
            dias: dias ?? this.dias,
        );

    factory MotivoMultaDto.fromJson(Map<String, dynamic> json) => MotivoMultaDto(
        id: json["id"],
        nombre: json["nombre"],
        dias: json["dias"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "dias": dias,
    };
}
