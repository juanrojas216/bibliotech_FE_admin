class ValorDto {

    int idCategoria;
    String nombre;

    ValorDto({
        required this.idCategoria,
        required this.nombre,
    });

    Map<String, dynamic> toMap() {
    return {
      'idCategoria': idCategoria,
      'nombre': nombre,
    };
  }
}