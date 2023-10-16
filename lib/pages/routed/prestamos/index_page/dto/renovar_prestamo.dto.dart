import 'dart:convert';

RenovarPrestamoDto renovarPrestamoFromJson(dynamic str) {
  Map<String, dynamic> data = str;
  return RenovarPrestamoDto.fromJson(data);
}

String renovarPrestamoToJson(RenovarPrestamoDto data) {
  return json.encode(data.toJson());
}

class RenovarPrestamoDto {
  
  int? idPrestamo;
  int? cantidadDiaz;

  RenovarPrestamoDto({
    required this.idPrestamo,
    required this.cantidadDiaz,
  });

  factory RenovarPrestamoDto.fromJson(Map<String, dynamic> json) =>
      RenovarPrestamoDto(
        idPrestamo: json["idPrestamo"],
        cantidadDiaz: json["cantidadDiaz"],
      );
  
   Map<String, dynamic> toJson() => {
        "idPrestamo;": idPrestamo,
        "cantidadDiaz": cantidadDiaz,
    };
}


