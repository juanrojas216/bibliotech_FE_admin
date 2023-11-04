
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

  SearchMultaDto copyWith({
        String? idUsuario,
        String? idPrestamo,
        DateTime? fechaDesde,
        DateTime? fechaHasta,
    }) => 
        SearchMultaDto(
            idUsuario: idUsuario ?? this.idUsuario,
            idPrestamo: idPrestamo ?? this.idPrestamo,
            fechaDesde: fechaDesde ?? this.fechaDesde,
            fechaHasta: fechaHasta ?? this.fechaHasta,
        );

  Map<String, dynamic> toMap() {
    return {
      'idUsuario': idUsuario,
      'idPrestamo': idPrestamo,
      'fechaDesde': fechaDesde == null ? null : '${fechaDesde?.toIso8601String().split('.')[0]}Z',
      'fechaHasta': fechaHasta == null ? null : '${fechaHasta?.toIso8601String().split('.')[0]}Z',
    };
  }
}
