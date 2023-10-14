import 'dart:convert';

String createParametroMultaToJson(CreateParametroMultaDto data) {
  return json.encode(data.toJson());
}

class CreateParametroMultaDto {
  String? nombre;
  int? dias;

  CreateParametroMultaDto({
    required this.nombre,
    required this.dias,
  });

  factory CreateParametroMultaDto.fromJson(Map<String, dynamic> json) =>
      CreateParametroMultaDto(
        nombre: json["descripcion"],
        dias: json["cantidadDias"],
      );
  
   Map<String, dynamic> toJson() => {
        "descripcion": nombre,
        "cantidadDias": dias
    };
}
