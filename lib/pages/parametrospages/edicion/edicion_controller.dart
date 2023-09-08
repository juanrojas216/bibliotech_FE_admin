import 'dart:convert';

import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/models/ediciones.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/api/http_admin.dart';

final edicionesABMProvider = FutureProvider<void>((ref) async {
  var response = await ref
      .watch(apiProvider)
      .request<List<Edicion>>('/ediciones.json', parser: edicionFromJson);

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
        body: edicionToJson(
          ref.read(listaEdicionABMProvider),
        ),
      );

  if (response.error != null) {
    throw response.error!;
  }

  ref.invalidate(edicionesABMProvider);
});

final modificarEdicionProvider = FutureProvider<void>((ref) async {
  
  await Future.delayed(Duration(seconds: 5));
  
  var response = await ref.watch(apiProvider).request<dynamic>(
        '/ediciones.json',
        method: HttpMethod.put,
        body: edicionToJson(ref.read(listaEdicionABMProvider)),
      );

  print(response.statusCode);

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
                titulo: titulo)
            .toJson()),
      );

  if (response.error != null) {
    throw response.error!;
  }

  ref.invalidate(edicionesABMProvider);
});

final inputEdicionABMProvider = StateProvider<String>((ref) {
  return '';
});

final filtroEdicionProvider = Provider<List<Edicion>>((ref) {
  var editoriales =
      ref.watch(listaEdicionABMProvider).map((e) => e.copyWith()).toList();
  var filtro = ref.watch(inputEdicionABMProvider);

  editoriales = editoriales
      .where((e) => e.titulo.toLowerCase().contains(filtro.toLowerCase()))
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
    state[index] = Edicion(id: idEdicion, titulo: tituloEdicion);
    state = [...state.map((e) => e.copyWith())];
  }
}
