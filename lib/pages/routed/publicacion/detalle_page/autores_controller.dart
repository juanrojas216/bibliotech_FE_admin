import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/new_models/autor.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/detalle_page/detalle_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

final autoresProvider = FutureProvider<void>((ref) async {
  var response = await ref
      .watch(apiProvider)
      .request<List<Autor>>('/autores.json', parser: autoresFromJson);

  if (response.error != null) {
    throw response.error!;
  }

  ref.read(listaAutoresProvider.notifier).updateListaAutores(response.data!);
});

final inputAutorProvider = StateProvider<String>((ref) {
  return '';
});

final filtroAutorProvider = Provider<List<ListTile>>((ref) {
  var autores =
      ref.watch(listaAutoresProvider).map((e) => e.copyWith()).toList();
  var filtro = ref.watch(inputAutorProvider);

  autores = autores
      .where((e) => e.nombre.toLowerCase().contains(filtro.toLowerCase()))
      .toList();

  List<ListTile> items = [];

  for (var a in autores) {
    items.add(
      ListTile(
        title: Text(a.nombre, style: GoogleFonts.poppins()),
        trailing: const Icon(Icons.add),
        onTap: () {
          ref.read(detallePublicacionProvider.notifier).addAutor(a);
          ref.read(routesProvider).pop();
        },
      ),
    );
  }

  return items;
});

final listaAutoresProvider =
    StateNotifierProvider<ListaAutoresNotifier, List<Autor>>((ref) {
  return ListaAutoresNotifier();
});

class ListaAutoresNotifier extends StateNotifier<List<Autor>> {
  ListaAutoresNotifier() : super([]);

  updateListaAutores(List<Autor> autores) {
    state = autores;
  }
}
