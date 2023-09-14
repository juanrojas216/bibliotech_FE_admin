import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/new_models/categoria.dart';
// import 'package:bibliotech_admin/models/categoria.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/detalle_page/detalle_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

final categoriasProvider = FutureProvider<void>((ref) async {
    
  var response = await ref
      .watch(apiProvider)
      .request<List<Categoria>>('/categorias.json', parser: categoriasFromJson);

  if (response.error != null) {
    throw response.error!;
  }

  ref
      .read(listaCategoriasProvider.notifier)
      .updateListaCategorias(response.data!);
});

final inputCategoriaProvider = StateProvider<String>((ref) {
  return '';
});

final filtroCategoriaProvider = Provider<List<ListTile>>((ref) {
  
  var categorias = ref.watch(listaCategoriasProvider).map((e) => e.copyWith()).toList();
  var filtro = ref.watch(inputCategoriaProvider);

  for (var c in categorias) {
    c.valores = c.valores
        .where(
            (v) => v.nombre.toLowerCase().contains(filtro.toLowerCase()))
        .toList();
  }

  categorias = categorias.where((e) => e.valores.isNotEmpty).toList();

  List<ListTile> items = [];

  for (var c in categorias) {
    items.add(ListTile(
        title: Text(c.nombre,
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold))));
    for (var v in c.valores) {
      items.add(ListTile(
        title: Text(v.nombre, style: GoogleFonts.poppins()),
        trailing: const Icon(Icons.add),
        onTap: () {
          ref.read(detallePublicacionProvider.notifier).addCategoria(c, v);
          ref.read(routesProvider).pop();
        },
      ));
    }
  }

  return items;
});

final listaCategoriasProvider =
    StateNotifierProvider<ListaCategoriasNotifier, List<Categoria>>((ref) {
  return ListaCategoriasNotifier();
});

class ListaCategoriasNotifier extends StateNotifier<List<Categoria>> {
  ListaCategoriasNotifier() : super([]);

  updateListaCategorias(List<Categoria> cateogiras) {
    state = cateogiras;
  }

}
