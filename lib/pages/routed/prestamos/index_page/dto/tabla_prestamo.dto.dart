
List<PrestamoItemTablaDto> prestamosTablaFromJson(dynamic data) {
  List<dynamic> str = data;
  return List<PrestamoItemTablaDto>.from(
      str.map((x) => PrestamoItemTablaDto.fromJson(x)));
}

PrestamoItemTablaDto prestamoTablaFromJson(dynamic str) {
  Map<String, dynamic> data = str;
  return PrestamoItemTablaDto.fromJson(data);
}

class PrestamoItemTablaDto {
  final int id;
  final String tituloPublicacion;
  final String idEjemplar;
  final String idUsuario;
  final DateTime fechaDesde;
  final DateTime fechaHasta;
  final String estado;

  PrestamoItemTablaDto({
    required this.id,
    required this.tituloPublicacion,
    required this.idEjemplar,
    required this.idUsuario,
    required this.fechaDesde,
    required this.fechaHasta,
    required this.estado,
  });

  factory PrestamoItemTablaDto.fromJson(Map<String, dynamic> json) =>
      PrestamoItemTablaDto(
        id: json["id"],
        tituloPublicacion: json["tituloPublicacion"],
        idEjemplar: json["idEjemplar"],
        idUsuario: json["idUsuario"],
        estado: json["estado"],
        fechaDesde: DateTime.parse(json["fechaDesde"]),
        fechaHasta: DateTime.parse(json["fechaHasta"]),
      );
}
