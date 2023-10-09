
class SearchMultaDto {
  final String? idUsuario;
  final String? idPrestamo;
  final DateTime? fechaDesde;
  final DateTime? fechaHasta;
  
  SearchMultaDto({
    required this.idUsuario,
    required this.idPrestamo,
    required this.fechaDesde,
    required this.fechaHasta,
  });

  Map<String, dynamic> toMap() {
    return {
      'idUsuario': idUsuario,
      'idPrestamo': idPrestamo,
      'fechaDesde': '${fechaDesde?.toIso8601String().split('.')[0]}Z',
      'fechaHasta': '${fechaHasta?.toIso8601String().split('.')[0]}Z',
    };
  }
}
