import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/new_models/editorial.dart';
// import 'package:bibliotech_admin/models/editoriales.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/detalle_page/detalle_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

final editorialesProvider = FutureProvider<void>((ref) async {
  var response = await ref
      .watch(apiProvider)
      .request<List<Editorial>>('/editoriales.json', parser: editorialesFromJson);

  if (response.error != null) {
    throw response.error!;
  }

  ref.read(listaEditorialesProvider.notifier).updateListaEditoriales(response.data!);
});

final inputEditorialProvider = StateProvider<String>((ref) {
  return '';
});

final filtroEditorialProvider = Provider<List<ListTile>>((ref) {
  var editoriales =
      ref.watch(listaEditorialesProvider).map((e) => e.copyWith()).toList();
  var filtro = ref.watch(inputEditorialProvider);

  editoriales = editoriales
      .where((e) => e.nombre.toLowerCase().contains(filtro.toLowerCase()))
      .toList();

  List<ListTile> items = [];

  for (var e in editoriales) {
    items.add(
      ListTile(
        title: Text(e.nombre, style: GoogleFonts.poppins()),
        trailing: const Icon(Icons.add),
        onTap: () {
          ref.read(detallePublicacionProvider.notifier).addEditorial(e);
          ref.read(routesProvider).pop();
        },
      ),
    );
  }

  return items;
});

final listaEditorialesProvider =
    StateNotifierProvider<ListaEditorialesNotifier, List<Editorial>>((ref) {
  return ListaEditorialesNotifier();
});

class ListaEditorialesNotifier extends StateNotifier<List<Editorial>> {
  ListaEditorialesNotifier() : super([]);

  updateListaEditoriales(List<Editorial> autores) {
    state = autores;
  }
}