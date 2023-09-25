class AutorDto {
  final String nombre;
  final DateTime fechaNacimiento;
  final String nacionalidad;
  final String biografia;
  
  AutorDto({
    required this.nombre,
    required this.fechaNacimiento,
    required this.nacionalidad,
    required this.biografia,
  });

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'fechaNacimiento': '${fechaNacimiento.toIso8601String().split('.')[0]}Z',
      'nacionalidad': nacionalidad,
      'biografia': biografia,
    };
  }
}
