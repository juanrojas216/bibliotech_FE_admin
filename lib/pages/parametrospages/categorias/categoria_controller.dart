import 'package:bibliotech_admin/models/categoria.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    state = [ ...state, Categoria(idCategoria: state.last.idCategoria+1, nombreCategoria: nombre, valores: [])];
  }

  deleteCategoria(int id){
    state = state.where((c) => c.idCategoria != id).toList();
    state = [ ...state.map((c) => c.copyInstance()) ];
  }
}