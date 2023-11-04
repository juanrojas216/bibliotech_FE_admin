
List<PublicacionDto> publicacionesFromJson(dynamic data) {
  print(data);
  List<dynamic> str = data;
  return List<PublicacionDto>.from(str.map((x) => PublicacionDto.fromJson(x)));
}

PublicacionDto publicacionFromJson(dynamic str) {
  Map<String, dynamic> data = str;
  return PublicacionDto.fromJson(data);
}

class PublicacionDto {
    final int id;
    final String titulo;
    final List<String> autores;
    final List<String> editoriales;
    final String edicion;
    final int anio;

    PublicacionDto({
        required this.id,
        required this.titulo,
        required this.autores,
        required this.editoriales,
        required this.edicion,
        required this.anio,
    });

    PublicacionDto copyWith({
        int? id,
        String? titulo,
        List<String>? autores,
        List<String>? editoriales,
        String? edicion,
        int? anio,
    }) => 
        PublicacionDto(
            id: id ?? this.id,
            titulo: titulo ?? this.titulo,
            autores: autores ?? this.autores,
            editoriales: editoriales ?? this.editoriales,
            edicion: edicion ?? this.edicion,
            anio: anio ?? this.anio,
        );

    factory PublicacionDto.fromJson(Map<String, dynamic> json) => PublicacionDto(
        id: json["id"],
        titulo: json["tituloPublicacion"],
        autores: List<String>.from(json["autores"].map((x) => '${x["nombre"]} ${x["apellido"]}')),
        editoriales: List<String>.from(json["editoriales"].map((x) => x["nombre"])),
        edicion: json["edicion"]["nombre"],
        anio: json["anioPublicacion"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "titulo": titulo,
        "autores": List<dynamic>.from(autores.map((x) => x)),
        "editoriales": List<dynamic>.from(editoriales.map((x) => x)),
        "edicion": edicion,
        "anio": anio,
    };
}