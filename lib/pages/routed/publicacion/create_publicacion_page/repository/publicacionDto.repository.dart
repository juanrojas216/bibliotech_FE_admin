import 'dart:js_interop';

import 'package:bibliotech_admin/models/index.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/create_publicacion_page/dto/publicacion.dto.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/create_publicacion_page/dto/link.dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final publicacionDtoProvider = StateNotifierProvider.autoDispose<PublicacionDtoNotifier, PublicacionDto>((ref) {
  return PublicacionDtoNotifier();
});

class PublicacionDtoNotifier extends StateNotifier<PublicacionDto> {
  PublicacionDtoNotifier()
      : super(
          PublicacionDto(
              anioPublicacion: 0,
              isbnPublicacion: '0',
              tituloPublicacion: '',
              sinopsis: '',
              nroPaginas: 0,
              autores: [],
              edicion: null,
              link: LinkDto(url: null, estado: null, plataformaId: null), 
              categorias: [],
              tipo: null,
              editoriales: []),
        );

  actualizarAnio(int? anio) {
    state.anioPublicacion = anio ?? 0;
    state = state.copyWith();
  }

  actualizarPages(int? pages) {
    state.nroPaginas = pages ?? 0;
    state = state.copyWith();
  }

  actualizarTitulo(String titulo) {
    state.tituloPublicacion = titulo;
    state = state.copyWith();
  }

  actualizarISBN(String isbn) {
    state.isbnPublicacion = isbn;
    state = state.copyWith();
  }

  actualizarEdicion(Edicion e) {
    state.edicion = e;
    state = state.copyWith();
  }

  actualizarTipo(TipoPublicacion tipo) {
    state.tipo = tipo;
    state = state.copyWith();
  }

  addCategoria(Categoria c, Valor v) {
    var categoriaOK = state.categorias.where((ca) => ca.categoria.id == c.id);
    if (categoriaOK.isEmpty) {
      state.categorias = [
        ...state.categorias,
        CategoriaPublicacion(categoria: c, valores: [v])
      ];
    } else {
      var valorOk = categoriaOK.first.valores.where((va) => va.id == v.id);
      if (valorOk.isEmpty) {
        categoriaOK.first.valores.add(v);
      }
    }
    state = state.copyWith();
  }

  deleteValor(int categoriaIndex, int valorIndex) {
    state.categorias[categoriaIndex].valores.removeAt(valorIndex);
    if (state.categorias[categoriaIndex].valores.isEmpty) {
      state.categorias.removeAt(categoriaIndex);
    }
    state = state.copyWith();
  }

  addAutor(Autor autor) {
    var autorOk = state.autores.where((a) => a.id == autor.id);
    if (autorOk.isEmpty) {
      state.autores.add(autor);
    }
    state = state.copyWith();
  }

  deleteAutor(int index) {
    state.autores.removeAt(index);
    state = state.copyWith();
  }

  addEditorial(Editorial editorial) {
    var editorialOK = state.editoriales.where((e) => e.id == editorial.id);
    if (editorialOK.isEmpty) {
      state.editoriales.add(editorial);
      state = state.copyWith();
    }
    state = state.copyWith();
  }

  deleteEditorial(int index) {
    state.editoriales.removeAt(index);
    state = state.copyWith();
  }

  resetearLink(){
    state.link = LinkDto(url: null, estado: null, plataformaId: null);
    state = state.copyWith();
  }

  actualizarLinkUrl(String url){
    if (state.link.isNull) {
      state = state.copyWith(link: LinkDto(url: url, estado: null, plataformaId: null));
      return;
    }
    state.link.url = url;
    state = state.copyWith();
  }

  actualizarLinkPlataforma(int id){
    if (state.link.isNull) {
      state = state.copyWith(link: LinkDto(url: null, estado: null, plataformaId: id));
      return;
    }
    state.link.plataformaId = id;
    state = state.copyWith();
  }

  actualizarLinkEstado(String estado){
    if (state.link.isNull) {
      state = state.copyWith(link: LinkDto(url: null, estado: estado, plataformaId: null));
      return;
    }
    state.link.estado = estado;
    state = state.copyWith();
  }

}
