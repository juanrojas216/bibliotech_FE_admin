import 'package:bibliotech_admin/new_models/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final detallePublicacionProvider = StateNotifierProvider<DetallePublicacionNotifier, Publicacion>((ref) {
  return DetallePublicacionNotifier();
});

class DetallePublicacionNotifier extends StateNotifier<Publicacion> {
  DetallePublicacionNotifier()
      : super(
          Publicacion(
            id: 1,
            anioPublicacion: 1,
            isbnPublicacion: '1',
            tituloPublicacion: '1',
            nroPaginas: 1,
            autores: [],
            edicion: Edicion(id: 1, nombre: '1'),
            link: Link(
              id: 1,
              url: '1',
              estado: 'ACTIVO',
              plataforma: Plataforma(
                id: 1,
                nombre: '1',
                url: '1',
                instrucciones: '1',
              ),
            ),
            categorias: [],
            tipo: TipoPublicacion(id: 1, nombre: '1'),
            editoriales: [],
            comentarios: [],
            ejemplares: [],
          ),
        );

  actualizarDetallePublicacion(Publicacion dp) {
    state = dp;
  }

  actualizarAnio(int anio) {
    state = state.copyWith(anioPublicacion: anio);
  }

  actualizarTitulo(String titulo) {
    state = state.copyWith(tituloPublicacion: titulo);
  }

  actualizarISBN(int isbn) {
    state = state.copyWith(isbnPublicacion: isbn.toString());
  }

  actualizarEdicion(Edicion e) {
    state = state.copyWith();
    state.edicion = e;
  }

  actualizarTipo(TipoPublicacion tipo) {
    state = state.copyWith(tipo: tipo);
  }

  addCategoria(Categoria c, Valor v) {
    var categoriaOK = state.categorias.where((ca) => ca.categoria.id == c.id);
    if (categoriaOK.isEmpty) {
      state = state.copyWith(categorias: [
        ...state.categorias,
        CategoriaPublicacion(categoria: c, valores: [v])
      ]);
    } else {
      var valorOk = categoriaOK.first.valores.where((va) => va.id == v.id);
      if (valorOk.isEmpty) {
        categoriaOK.first.valores.add(v);
        state = state.copyWith();
      }
    }
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
      state = state.copyWith();
    }
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
  }

  deleteEditorial(int index) {
    state.editoriales.removeAt(index);
    state = state.copyWith();
  }
}
