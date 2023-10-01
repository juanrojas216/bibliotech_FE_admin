import 'package:bibliotech_admin/new_models/index.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/create_publicacion_page/dto/link.dto.dart';

class PublicacionDto {
  int anioPublicacion;
  String isbnPublicacion;
  String tituloPublicacion;
  int nroPaginas;
  List<Autor> autores;
  Edicion? edicion;
  LinkDto link;
  List<CategoriaPublicacion> categorias;
  TipoPublicacion? tipo;
  List<Editorial> editoriales;

  PublicacionDto({
    required this.anioPublicacion,
    required this.isbnPublicacion,
    required this.tituloPublicacion,
    required this.nroPaginas,
    required this.autores,
    required this.edicion,
    required this.link,
    required this.categorias,
    required this.tipo,
    required this.editoriales,
  });

  Map<String, dynamic> toMap() {
    return {
      'anioPublicacion': anioPublicacion,
      'isbnPublicacion': isbnPublicacion,
      'tituloPublicacion': tituloPublicacion,
      'nroPaginas': nroPaginas,
      'autores': autores,
      'edicion': edicion,
      'link': link,
      'categorias': categorias,
      'tipo': tipo,
      'editoriales': editoriales,
    };
  }

  PublicacionDto copyWith({
        int? anioPublicacion,
        String? isbnPublicacion,
        String? tituloPublicacion,
        int? nroPaginas,
        List<Autor>? autores,
        Edicion? edicion,
        LinkDto? link,
        List<CategoriaPublicacion>? categorias,
        TipoPublicacion? tipo,
        List<Editorial>? editoriales,
    }) => 
        PublicacionDto(
            anioPublicacion: anioPublicacion ?? this.anioPublicacion,
            isbnPublicacion: isbnPublicacion ?? this.isbnPublicacion,
            tituloPublicacion: tituloPublicacion ?? this.tituloPublicacion,
            nroPaginas: nroPaginas ?? this.nroPaginas,
            autores: autores ?? this.autores,
            edicion: edicion ?? this.edicion,
            link: link ?? this.link,
            categorias: categorias ?? this.categorias,
            tipo: tipo ?? this.tipo,
            editoriales: editoriales ?? this.editoriales,
        );
}
