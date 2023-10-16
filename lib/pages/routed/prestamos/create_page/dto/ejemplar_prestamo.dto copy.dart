List<EjemplarPrestamoDto> ejemplaresPrestamoFromJson(dynamic data) {
  List<dynamic> str = data;
  return List<EjemplarPrestamoDto>.from(str.map((x) => EjemplarPrestamoDto.fromJson(x)));
}

EjemplarPrestamoDto ejemplarPrestamoFromJson(dynamic str) {
  Map<String, dynamic> data = str;
  return EjemplarPrestamoDto.fromJson(data);
}

class EjemplarPrestamoDto {
    final int id;
    final String valoracion;

    EjemplarPrestamoDto({
        required this.id,
        required this.valoracion,
    });

    EjemplarPrestamoDto copyWith({
        int? id,
        String? valoracion

    }) => 
        EjemplarPrestamoDto(
            id: id ?? this.id,
            valoracion: valoracion ?? this.valoracion,

        );

    factory EjemplarPrestamoDto.fromJson(Map<String, dynamic> json) => EjemplarPrestamoDto(
        id: json["id"],
        valoracion: json["valoracion"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "valoracion": valoracion,
    };
}