
class SearchUsuarioDto {
  String? idUsuario;
  String? legajo;
  String? nombre;
  String? apellido;
  
  SearchUsuarioDto({
    required this.idUsuario,
    required this.legajo,
    required this.apellido,
    required this.nombre,
  });

  Map<String, dynamic> toMap() {
    return {
      'idUsuario': idUsuario,
      'nombre': nombre,
      'apellido': apellido,
      'legajo': legajo,
    };
  }
}
