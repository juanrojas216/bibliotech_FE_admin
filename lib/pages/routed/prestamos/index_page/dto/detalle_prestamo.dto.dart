DetallePrestamoDto detallePrestamoFromJson(dynamic str) {
  Map<String, dynamic> data = str;
  return DetallePrestamoDto.fromJson(data);
}

class DetallePrestamoDto {
    final String usuario;
    final String publicacion;
    final String ejemplar;
    final String fechaInicioPrestamo;
    final String fechaFinPrestamo;
    final String fechaDevolucion;
    final String estado;
    final List<RenovacionDto> renovaciones;

    DetallePrestamoDto({
        required this.usuario,
        required this.publicacion,
        required this.ejemplar,
        required this.fechaInicioPrestamo,
        required this.fechaFinPrestamo,
        required this.fechaDevolucion,
        required this.estado,
        required this.renovaciones
    });

    factory DetallePrestamoDto.fromJson(Map<String, dynamic> json) => DetallePrestamoDto(
        usuario: json["usuario"],
        publicacion: json["publicacion"],
        ejemplar: json["ejemplar"],
        fechaInicioPrestamo: json["fechaInicioPrestamo"],
        fechaFinPrestamo: json["fechaFinPrestamo"],
        fechaDevolucion: json["fechaDevolucion"],
        estado: json["estado"],
        renovaciones: List<RenovacionDto>.from(json["renovaciones"].map((x) => RenovacionDto.fromJson(x))),
    );
}

class RenovacionDto {
    final String fechaInicioRenovacion;
    final String fechaFinRenovacion;
    // final String? descripcion;

    RenovacionDto({
        required this.fechaInicioRenovacion,
        required this.fechaFinRenovacion,
        // this.descripcion,
    });

    factory RenovacionDto.fromJson(Map<String, dynamic> json) => RenovacionDto(
        fechaInicioRenovacion: json["fechaInicioRenovacion"],
        fechaFinRenovacion: json["fechaFinRenovacion"],
    );
}
