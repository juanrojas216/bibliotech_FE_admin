// import 'package:bibliotech_admin/models/categoria.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../new_models/categoria.dart';

final listaCategoriasABMProvider =
    StateNotifierProvider<ListaCategoriasABMNotifier, List<Categoria>>((ref) {
  return ListaCategoriasABMNotifier();
});

class ListaCategoriasABMNotifier extends StateNotifier<List<Categoria>> {
  ListaCategoriasABMNotifier() : super([]);

  updateListaCategorias(List<Categoria> categorias) {
    state = categorias;
  }

  agregarCategoria(String nombre){
    state = [ ...state, Categoria(id: state.last.id+1, nombre: nombre, valores: [])];
  }

  deleteCategoria(int id){
    state = state.where((c) => c.id != id).toList();
    state = [ ...state.map((c) => c.copyWith()) ];
  }
}