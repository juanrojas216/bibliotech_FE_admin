

class CreatePrestamoDto {
  final String? idUsuario;
  // final String? idPublicacion;
  // final String? idEjemplar;
  final String? ejemplarId;
  // final String? idMotivoMulta;
  // final String? nombrePublicacion;
  // final String? nombre;
  final DateTime? fechaInicioPrestamo;
  final DateTime? fechaFinPrestamo;
  
  CreatePrestamoDto({
    required this.idUsuario,
    // required this.idMotivoMulta,
    // required this.idPublicacion,
    // required this.idEjemplar,
    // required this.nombre,
    // required this.nombrePublicacion,
    required this.ejemplarId,
    required this.fechaInicioPrestamo,
    required this.fechaFinPrestamo,
  });

  Map<String, dynamic> toMap() {
    return {
      'usuarioID': idUsuario,
      'ejemplarID': ejemplarId,
      // 'idMotivoMulta': idMotivoMulta,
      // 'idEjemplar': idEjemplar,
      // 'nombrePublicacion': nombrePublicacion,
      // 'nombre': nombre,
      // 'idPublicacion': idPublicacion,
      'fechaInicioEstimada': fechaInicioPrestamo != null ? '${fechaInicioPrestamo!.toIso8601String().split('.')[0]}Z' : null,
      'fechaFinEstimada': fechaFinPrestamo != null ? '${fechaFinPrestamo!.toIso8601String().split('.')[0]}Z' : null,
    };
  }
}
