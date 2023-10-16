import 'dart:convert';

List<ParametrosPrestamoDto> parametrosPrestamoFromJson(dynamic data) {
  List<dynamic> str = data;
  return List<ParametrosPrestamoDto>.from(
      str.map((x) => ParametrosPrestamoDto.fromJson(x)));
}

ParametrosPrestamoDto parametroPrestamoFromJson(dynamic str) {
  Map<String, dynamic> data = str;
  return ParametrosPrestamoDto.fromJson(data);
}

String parametroPrestamoToJson(ParametrosPrestamoDto data) {
  return json.encode(data.toJson());
}

class ParametrosPrestamoDto {
  
  int? diasMaximoPrestamo;
  int? diasMaximoRenovacion;
  int? cantidadMaximaRenovacion;

  ParametrosPrestamoDto({
    required this.diasMaximoPrestamo,
    required this.diasMaximoRenovacion,
    required this.cantidadMaximaRenovacion,
  });

  factory ParametrosPrestamoDto.fromJson(Map<String, dynamic> json) =>
      ParametrosPrestamoDto(
        diasMaximoPrestamo: json["diasMaximoPrestamo"],
        diasMaximoRenovacion: json["diasMaximoRenovacion"],
        cantidadMaximaRenovacion: json["cantidadMaximaRenovacion"],
      );
  
   Map<String, dynamic> toJson() => {
        "diasMaximoPrestamo": diasMaximoPrestamo,
        "diasMaximoRenovacion": diasMaximoRenovacion,
        "cantidadMaximaRenovacion": cantidadMaximaRenovacion
    };
}
