
class SearchPrestamoDto {
  
  final String? dni;
  final String? tituloPublicacion;
  final DateTime? fechaDesde;
  final DateTime? fechaHasta;
  
  SearchPrestamoDto({
    required this.dni,
    required this.tituloPublicacion,
    required this.fechaDesde,
    required this.fechaHasta,
  });

  SearchPrestamoDto copyWith({
        String? dni,
        String? tituloPublicacion,
        DateTime? fechaDesde,
        DateTime? fechaHasta,
    }) => 
        SearchPrestamoDto(
            dni: dni ?? this.dni,
            tituloPublicacion: tituloPublicacion ?? this.tituloPublicacion,
            fechaDesde: fechaDesde ?? this.fechaDesde,
            fechaHasta: fechaHasta ?? this.fechaHasta,
        );

  Map<String, dynamic> toMap() {
    return {
      'dni': dni,
      'tituloPublicacion': tituloPublicacion,
      'fechaDesde': '${fechaDesde?.toIso8601String().split('.')[0]}Z',
      'fechaHasta': '${fechaHasta?.toIso8601String().split('.')[0]}Z',
    };
  }
}
