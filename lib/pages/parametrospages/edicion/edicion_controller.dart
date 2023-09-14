import 'dart:convert';

import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/new_models/edicion.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/api/http_admin.dart';

final edicionesABMProvider = FutureProvider<void>((ref) async {
  var response = await ref
      .watch(apiProvider)
      .request<List<Edicion>>('/ediciones.json', parser: edicionesFromJson);

  if (response.error != null) {
    throw response.error!;
  }

  ref
      .read(listaEdicionABMProvider.notifier)
      .updateListaEdiciones(response.data!);
});

final eliminarEdicionProvider = FutureProvider<void>((ref) async {
  var response = await ref.watch(apiProvider).request<dynamic>(
        '/ediciones.json',
        method: HttpMethod.put,
        body: edicionesToJson(
          ref.read(listaEdicionABMProvider),
        ),
      );

  if (response.error != null) {
    throw response.error!;
  }

  ref.invalidate(edicionesABMProvider);
});

final modificarEdicionProvider = FutureProvider<void>((ref) async {
  
  var response = await ref.watch(apiProvider).request<dynamic>(
        '/ediciones.json',
        method: HttpMethod.put,
        body: edicionesToJson(ref.read(listaEdicionABMProvider)),
      );

  if (response.error != null) {
    throw response.error!;
  }

  ref.invalidate(edicionesABMProvider);
});

final agregarEdicionProvider =
    FutureProvider.family<void, String>((ref, titulo) async {
  var response = await ref.watch(apiProvider).request<dynamic>(
        '/ediciones/${ref.read(listaEdicionABMProvider).length}.json',
        method: HttpMethod.put,
        body: json.encode(Edicion(
                id: ref.read(listaEdicionABMProvider).last.id + 1,
                nombre: titulo)
            .toJson()),
      );

  if (response.error != null) {
    throw response.error!;
  }

  ref.invalidate(edicionesABMProvider);
});

final filtroEdicionProvider = Provider.family<List<Edicion>, String>((ref, filtro) {
  var editoriales =
      ref.watch(listaEdicionABMProvider).map((e) => e.copyWith()).toList();
  // var filtro = ref.watch(inputEdicionABMProvider);

  editoriales = editoriales
      .where((e) => e.nombre.toLowerCase().contains(filtro.toLowerCase()))
      .toList();

  return editoriales;
});

final listaEdicionABMProvider =
    StateNotifierProvider<ListaEdicionesABMNotifier, List<Edicion>>((ref) {
  return ListaEdicionesABMNotifier();
});

class ListaEdicionesABMNotifier extends StateNotifier<List<Edicion>> {
  ListaEdicionesABMNotifier() : super([]);

  updateListaEdiciones(List<Edicion> ediciones) {
    state = ediciones;
  }

  deleteEdicion(int id) {
    state = state.where((e) => e.id != id).toList();
    state = [...state.map((e) => e.copyWith())];
  }

  modificarEdicion(int idEdicion, String tituloEdicion) {
    int index = state.indexOf(state.firstWhere((e) => e.id == idEdicion));
    state[index] = Edicion(id: idEdicion, nombre: tituloEdicion);
    state = [...state.map((e) => e.copyWith())];
  }
}
