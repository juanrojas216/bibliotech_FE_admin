
class UbicacionDto {
  final String descripcion;
  final bool ocupada;
  
  UbicacionDto({
    required this.descripcion,
    required this.ocupada,
  });

  Map<String, dynamic> toMap() {
    return {
      'descripcion': descripcion,
      'ocupada': ocupada,
    };
  }
}
