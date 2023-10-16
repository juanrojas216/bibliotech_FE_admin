import 'dart:convert';

ValidarRenovacionPrestamoDto validarRenovacionPrestamoFromJson(dynamic str) {
  Map<String, dynamic> data = str;
  return ValidarRenovacionPrestamoDto.fromJson(data);
}

String validarRenovacionPrestamoToJson(ValidarRenovacionPrestamoDto data) {
  return json.encode(data.toJson());
}

class ValidarRenovacionPrestamoDto {
  
  int? cantidadRenovacionesDispoibles;
  String? fechaFinalizacionPrevista;

  ValidarRenovacionPrestamoDto({
    required this.cantidadRenovacionesDispoibles,
    required this.fechaFinalizacionPrevista,
  });

  factory ValidarRenovacionPrestamoDto.fromJson(Map<String, dynamic> json) =>
      ValidarRenovacionPrestamoDto(
        cantidadRenovacionesDispoibles: json["cantidadRenovacionesDispoibles"],
        fechaFinalizacionPrevista: json["fechaFinalizacionPrevista"],
      );
  
   Map<String, dynamic> toJson() => {
        "cantidadRenovacionesDispoibles": cantidadRenovacionesDispoibles,
        "fechaFinalizacionPrevista": fechaFinalizacionPrevista,
    };
}


