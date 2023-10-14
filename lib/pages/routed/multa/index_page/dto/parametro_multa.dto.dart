import 'dart:convert';

List<ParametroMultaDto> parametrosMultaFromJson(dynamic data) {
  List<dynamic> str = data;
  return List<ParametroMultaDto>.from(
      str.map((x) => ParametroMultaDto.fromJson(x)));
}

ParametroMultaDto parametroMultaFromJson(dynamic str) {
  Map<String, dynamic> data = str;
  return ParametroMultaDto.fromJson(data);
}

String parametroMultaToJson(ParametroMultaDto data) {
  return json.encode(data.toJson());
}

class ParametroMultaDto {
  final int id;
  String nombre;
  int dias;

  ParametroMultaDto({
    required this.id,
    required this.nombre,
    required this.dias,
  });

  factory ParametroMultaDto.fromJson(Map<String, dynamic> json) =>
      ParametroMultaDto(
        id: json["id"],
        nombre: json["descripcion"],
        dias: json["cantidadDias"],
      );
  
   Map<String, dynamic> toJson() => {
        "id": id,
        "descripcion": nombre,
        "cantidadDias": dias
    };
}
