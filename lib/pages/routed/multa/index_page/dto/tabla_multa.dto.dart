
List<MultaItemTablaDto> multasTablaFromJson(dynamic data) {
  List<dynamic> str = data;
  return List<MultaItemTablaDto>.from(
      str.map((x) => MultaItemTablaDto.fromJson(x)));
}

MultaItemTablaDto multaTablaFromJson(dynamic str) {
  Map<String, dynamic> data = str;
  return MultaItemTablaDto.fromJson(data);
}

class MultaItemTablaDto {
  final int id;
  final String idPrestamo;
  final String idUsuario;
  final DateTime fechaDesde;
  final DateTime fechaHasta;
  final String estado;
  final String tipo;

  MultaItemTablaDto({
    required this.id,
    required this.idPrestamo,
    required this.idUsuario,
    required this.fechaDesde,
    required this.fechaHasta,
    required this.estado,
    required this.tipo,
  });

  factory MultaItemTablaDto.fromJson(Map<String, dynamic> json) =>
      MultaItemTablaDto(
        id: json["id"],
        idPrestamo: json["idPrestamo"],
        idUsuario: json["idUsuario"],
        estado: json["estado"],
        tipo: json["tipo"],
        fechaDesde: DateTime.parse(json["fechaDesde"]),
        fechaHasta: DateTime.parse(json["fechaHasta"]),
      );
}
