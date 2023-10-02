class CambiarEstadoDto {

  int idEjemplar;
  int idUsuario;
  String nombreEstado;


  CambiarEstadoDto({
    required this.idEjemplar,
    required this.idUsuario,
    required this.nombreEstado,
  });

  Map<String, dynamic> toMap() {
    return {
      'idEjemplar': idEjemplar,
      'idUsuario': idUsuario,
      'nombreEstado': nombreEstado,
    };
  }
}