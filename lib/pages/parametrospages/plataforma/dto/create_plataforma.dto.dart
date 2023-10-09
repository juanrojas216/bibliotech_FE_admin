
class CreatePlataformaDto{
  String nombre;
  // String url;
  String instrucciones;

  CreatePlataformaDto({
    required this.nombre, 
    // required this.url, 
    required this.instrucciones, 
  });

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      // 'url': url,
      'instrucciones': instrucciones,
    };
  }  
}


