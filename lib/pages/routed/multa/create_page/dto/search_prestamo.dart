
class SearchPrestamoDto {
  int? idPrestamo;
  String? nombrePublicacion;
  String? idEjemplar;
  String? idUsuario;
  
  SearchPrestamoDto({
    required this.idPrestamo,
    required this.nombrePublicacion,
    required this.idEjemplar,
    this.idUsuario,
  });

  Map<String, dynamic> toMap() {
    return {
      'idPrestamo': idPrestamo,
      'nombreLibro': nombrePublicacion,
      'idEjemplar': idEjemplar,
      'idUsuario': idUsuario,
    };
  }
}
