List<PublicacionPrestamoDto> publicacionesPrestamoFromJson(dynamic data) {
  List<dynamic> str = data;
  return List<PublicacionPrestamoDto>.from(str.map((x) => PublicacionPrestamoDto.fromJson(x)));
}

PublicacionPrestamoDto publicacionPrestamoFromJson(dynamic str) {
  Map<String, dynamic> data = str;
  return PublicacionPrestamoDto.fromJson(data);
}

class PublicacionPrestamoDto {
    final int id;
    //final String isbn;
    final String titulo;
    final List<String> autores;
    //final List<String> editoriales;
    final String editorial;
    final String edicion;
    final int anio;

    PublicacionPrestamoDto({
        required this.id,
        //required this.isbn,
        required this.titulo,
        required this.autores,
        //required this.editoriales,
        required this.editorial,
        required this.edicion,
        required this.anio,
    });

    PublicacionPrestamoDto copyWith({
        int? id,
        String? isbn,
        String? titulo,
        List<String>? autores,
        List<String>? editoriales,
        String? editorial,
        String? edicion,
        int? anio,
    }) => 
        PublicacionPrestamoDto(
            id: id ?? this.id,
            //isbn: isbn ?? this.isbn,
            titulo: titulo ?? this.titulo,
            autores: autores ?? this.autores,
            //editoriales: editoriales ?? this.editoriales,
            editorial: editorial ?? this.editorial,
            edicion: edicion ?? this.edicion,
            anio: anio ?? this.anio,
        );

    factory PublicacionPrestamoDto.fromJson(Map<String, dynamic> json) => PublicacionPrestamoDto(
        id: json["id"],
        //isbn: json["isbn"],
        titulo: json["tituloPublicacion"],
        autores: List<String>.from(json["nombreAutores"].map((x) => x)),
        //editoriales: List<String>.from(json["nombreEditoriales"].map((x) => x)),
        editorial: json["nombreEditorial"],
        edicion: json["nombreEdicion"],
        anio: json["anioPublicacion"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        //"isbn": isbn,
        "titulo": titulo,
        "autores": List<dynamic>.from(autores.map((x) => x)),
        //"editoriales": List<dynamic>.from(editoriales.map((x) => x)),
        "editorial": editorial,
        "edicion": edicion,
        "anio": anio,
    };
}