
class CategoriaDto{

  String nombre;
  
  CategoriaDto({
        required this.nombre,
    });
  
  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
    };
  }
}