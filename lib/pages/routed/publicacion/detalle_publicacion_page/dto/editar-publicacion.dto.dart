

import 'package:bibliotech_admin/models/index.dart';

class EditarPublicacionDto {
  final int idPublicacion;
  final int anioPublicacion;
  final String isbnPublicacion;
  final String tituloPublicacion;
  final String sinopsis;
  final int nroPaginas;
  final List<int> idAutores;
  final int idEdicion;
  final Link? link;
  final List<CategoriaDto> categorias;
  final int idTipo;
  final List<int> idEditoriales;

  EditarPublicacionDto({
    required this.idPublicacion,
    required this.anioPublicacion,
    required this.isbnPublicacion,
    required this.tituloPublicacion,
    required this.sinopsis,
    required this.nroPaginas,
    required this.idAutores,
    required this.idEdicion,
    required this.link,
    required this.categorias,
    required this.idTipo,
    required this.idEditoriales,
  });

  EditarPublicacionDto copyWith({
    int? idPublicacion,
    int? anioPublicacion,
    String? isbnPublicacion,
    String? tituloPublicacion,
    String? sinopsis,
    int? nroPaginas,
    List<int>? idAutores,
    int? idEdicion,
    Link? link,
    List<CategoriaDto>? categorias,
    int? idTipo,
    List<int>? idEditoriales,
  }) =>
      EditarPublicacionDto(
        idPublicacion: idPublicacion ?? this.idPublicacion,
        anioPublicacion: anioPublicacion ?? this.anioPublicacion,
        isbnPublicacion: isbnPublicacion ?? this.isbnPublicacion,
        tituloPublicacion: tituloPublicacion ?? this.tituloPublicacion,
        sinopsis: sinopsis ?? this.sinopsis,
        nroPaginas: nroPaginas ?? this.nroPaginas,
        idAutores: idAutores ?? this.idAutores,
        idEdicion: idEdicion ?? this.idEdicion,
        link: link ?? this.link,
        categorias: categorias ?? this.categorias,
        idTipo: idTipo ?? this.idTipo,
        idEditoriales: idEditoriales ?? this.idEditoriales,
      );

  Map<String, dynamic> toMap() => {
        "anioPublicacion": anioPublicacion,
        "isbnPublicacion": isbnPublicacion,
        "tituloPublicacion": tituloPublicacion,
        "sinopsisPublicacion": sinopsis,
        "nroPaginas": nroPaginas,
        "idsAutores": List<dynamic>.from(idAutores.map((x) => x)),
        "idEdicion": idEdicion,
        "link": link != null ? {
          "estado": link!.estado,
          "plataformaId": link!.plataforma!.id,
          "url": link!.url,
        } : null,
        "categorias": List<dynamic>.from(categorias.map((x) => x.toMap())),
        "idTipoPublicacion": idTipo,
        "idsEditoriales": List<dynamic>.from(idEditoriales.map((x) => x)),
      };
}

class CategoriaDto {
  final int idCategoria;
  final List<int> idValores;

  CategoriaDto({
    required this.idCategoria,
    required this.idValores,
  });

  CategoriaDto copyWith({
    int? idCategoria,
    List<int>? idValores,
  }) =>
      CategoriaDto(
        idCategoria: idCategoria ?? this.idCategoria,
        idValores: idValores ?? this.idValores,
      );

  Map<String, dynamic> toMap() => {
        "idCategoria": idCategoria,
        "idValores": List<dynamic>.from(idValores.map((x) => x)),
      };
}

createDtoUpdatePublicaion(Publicacion p) {
  return EditarPublicacionDto(
      idPublicacion: p.id,
      anioPublicacion: p.anioPublicacion,
      isbnPublicacion: p.isbnPublicacion,
      tituloPublicacion: p.tituloPublicacion,
      sinopsis: p.sinopsis,
      nroPaginas: p.nroPaginas,
      idAutores: p.autores.map((e) => e.id).toList(),
      idEdicion: p.edicion.id,
      link: p.link.url == null ? null : p.link,
      categorias: p.categorias.map(
        (e) => CategoriaDto(
          idCategoria: e.categoria.id,
          idValores: e.valores.map((v) => v.id).toList(),
        ),
      ).toList(),
      idTipo: p.tipo.id,
      idEditoriales: p.editoriales.map((e) => e.id).toList());
}
