

class CreatePrestamoDto {
  final int? idUsuario;
  final int? ejemplarId;
  final DateTime? fechaInicioPrestamo;
  final DateTime? fechaFinPrestamo;
  
  CreatePrestamoDto({
    required this.idUsuario,
    required this.ejemplarId,
    required this.fechaInicioPrestamo,
    required this.fechaFinPrestamo,
  });

  Map<String, dynamic> toMap() {
    return {
      'usuarioID': idUsuario,
      'ejemplarID': ejemplarId,
      'fechaInicioEstimada': fechaInicioPrestamo != null ? '${fechaInicioPrestamo!.toIso8601String().split('.')[0]}Z' : null,
      'fechaFinEstimada': fechaFinPrestamo != null ? '${fechaFinPrestamo!.toIso8601String().split('.')[0]}Z' : null,
    };
  }
}
