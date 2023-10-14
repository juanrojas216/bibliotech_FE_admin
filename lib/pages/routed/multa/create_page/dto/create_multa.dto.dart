

class CreateMultaDto {
  final String? idUsuario;
  // final String? idPublicacion;
  // final String? idEjemplar;
  final String? idPrestamo;
  final String? idMotivoMulta;
  // final String? nombrePublicacion;
  // final String? nombre;
  final DateTime? fechaInicioMulta;
  
  CreateMultaDto({
    required this.idUsuario,
    required this.idMotivoMulta,
    // required this.idPublicacion,
    // required this.idEjemplar,
    // required this.nombre,
    // required this.nombrePublicacion,
    required this.idPrestamo,
    required this.fechaInicioMulta,
  });

  Map<String, dynamic> toMap() {
    return {
      'idUsuario': idUsuario,
      'idMotivoMulta': idMotivoMulta,
      'idPrestamo': idPrestamo,
      // 'idEjemplar': idEjemplar,
      // 'nombrePublicacion': nombrePublicacion,
      // 'nombre': nombre,
      // 'idPublicacion': idPublicacion,
      'fechaInicioMulta': fechaInicioMulta != null ? '${fechaInicioMulta!.toIso8601String().split('.')[0]}Z' : null,
    };
  }
}
