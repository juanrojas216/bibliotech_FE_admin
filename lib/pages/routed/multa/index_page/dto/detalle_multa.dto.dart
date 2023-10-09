DetalleMultaDto detalleMultaFromJson(dynamic str) {
  Map<String, dynamic> data = str;
  return DetalleMultaDto.fromJson(data);
}

class DetalleMultaDto {
    final int id;
    final String usuario;
    final String publicacion;
    final String ejemplar;
    final String fechaDesde;
    final String fechaHasta;
    final String estado;
    final String tipo;
    final String? descripcion;

    DetalleMultaDto({
        required this.id,
        required this.usuario,
        required this.publicacion,
        required this.ejemplar,
        required this.fechaDesde,
        required this.fechaHasta,
        required this.estado,
        required this.tipo,
        this.descripcion,
    });

    factory DetalleMultaDto.fromJson(Map<String, dynamic> json) => DetalleMultaDto(
        id: json["id"],
        usuario: json["usuario"],
        publicacion: json["publicacion"],
        ejemplar: json["ejemplar"],
        fechaDesde: json["fechaDesde"],
        fechaHasta: json["fechaHasta"],
        estado: json["estado"],
        tipo: json["tipo"],
        descripcion: json["descripcion"],
    );
}
