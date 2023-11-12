import 'package:bibliotech_admin/models/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/getPublicacion.controller.dart';

final publicacionProvider = StateNotifierProvider.autoDispose
    .family<PublicacionNotifier, Publicacion, int>((ref, id) {
  var publicacion = ref.watch(getPublicacionProvider(id));
  return PublicacionNotifier(publicacion);
  // PublicacionNotifier(publicacion);
});

class PublicacionNotifier extends StateNotifier<Publicacion> {
  PublicacionNotifier(AsyncValue<Publicacion> data)
      : super(data.when(
          data: (data) => data,
          error: (error, stackTrace) => Publicacion(
            id: 0,
            anioPublicacion: 0,
            isbnPublicacion: '0',
            tituloPublicacion: 'Titulo',
            sinopsis: '',
            nroPaginas: 0,
            autores: [],
            edicion: Edicion(id: 0, nombre: 'Edicion'),
            link: Link(
                url: null,
                estado: null,
                plataforma: Plataforma(
                    id: 0,
                    nombre: 'Plataforma',
                    // url: 'url',
                    instrucciones: 'instrucciones')),
            categorias: [],
            tipo: TipoPublicacion(id: 0, nombre: 'Tipo'),
            editoriales: [],
            //comentarios: [], ejemplares: [],
          ),
          loading: () => Publicacion(
            id: 0,
            anioPublicacion: 0,
            isbnPublicacion: '0',
            tituloPublicacion: 'Titulo',
            sinopsis: '',
            nroPaginas: 0,
            autores: [],
            edicion: Edicion(id: 0, nombre: 'Edicion'),
            link: Link(
                url: null,
                estado: null,
                plataforma: Plataforma(
                    id: 0,
                    nombre: 'Plataforma',
                    // url: 'url',
                    instrucciones: 'instrucciones')),
            categorias: [],
            tipo: TipoPublicacion(id: 0, nombre: 'Tipo'),
            editoriales: [],
            //comentarios: [], ejemplares: [],
          ),
        ));

  actualizarPublicacion(Publicacion publicacion) {
    state = publicacion.copyWith();
  }

  actualizarAnio(int anio) {
    state.anioPublicacion = anio;
    state = state.copyWith();
  }

  actualizarPages(int pages) {
    state.nroPaginas = pages;
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

  resetearLink() {
    state.link.estado = null;
    state.link.plataforma = null;
    state.link.url = null;
    state = state.copyWith();
  }

  actualizarLinkUrl(String url) {
    state.link.url = url;
    state = state.copyWith();
  }

  actualizarLinkPlataforma(Plataforma plataforma) {
    state.link.plataforma = plataforma;
    state = state.copyWith();
  }

  actualizarLinkEstado(String estado) {
    state.link.estado = estado;
    state = state.copyWith();
  }
}
