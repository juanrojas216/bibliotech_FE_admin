import 'dart:convert';

EstadoPrestamoDto estadoPrestamoFromJson(dynamic str) {
  Map<String, dynamic> data = str;
  return EstadoPrestamoDto.fromJson(data);
}

String estadoPrestamoToJson(EstadoPrestamoDto data) {
  return json.encode(data.toJson());
}

class EstadoPrestamoDto {
  
  int? idPrestamo;
  String? estado;

  EstadoPrestamoDto({
    required this.idPrestamo,
    required this.estado,
  });

  factory EstadoPrestamoDto.fromJson(Map<String, dynamic> json) =>
      EstadoPrestamoDto(
        idPrestamo: json["idPrestamo"],
        estado: json["estado"],
      );
  
   Map<String, dynamic> toJson() => {
        "idPrestamo": idPrestamo,
        "estado": estado,
    };
}


