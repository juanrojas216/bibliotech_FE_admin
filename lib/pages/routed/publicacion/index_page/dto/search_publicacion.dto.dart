
class SearchPublicacionDto {
  final String? titulo;
  final String? autor;
  final String? isbn;
  final String? anio;
  
  SearchPublicacionDto({
    required this.titulo,
    required this.autor,
    required this.isbn,
    required this.anio,
  });

  Map<String, dynamic> toMap() {
    return {
      'titulo': titulo,
      'autor': autor,
      'isbn': isbn,
      'anio': anio,
    };
  }
}
