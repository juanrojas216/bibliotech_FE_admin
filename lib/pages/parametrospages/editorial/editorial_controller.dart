import 'dart:convert';

import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/api/http_admin.dart';
import '../../../models/editoriales.dart';

final editorialesABMProvider = FutureProvider<void>((ref) async {
  var response = await ref
      .watch(apiProvider)
      .request<List<Editorial>>('/editoriales.json', parser: editorialFromJson);

  if (response.error != null) {
    throw response.error!;
  }

  ref
      .read(listaEditorialesABMProvider.notifier)
      .updateListaEditoriales(response.data!);
});

final eliminarEditorialProvider = FutureProvider<void>((ref) async {
  var response = await ref.watch(apiProvider).request<dynamic>(
        '/editoriales.json',
        method: HttpMethod.put,
        body: editorialToJson(
          ref.read(listaEditorialesABMProvider),
        ),
      );

  if (response.error != null) {
    throw response.error!;
  }

  ref.invalidate(editorialesABMProvider);
});

final modificarEditorialProvider = FutureProvider<void>((ref) async {
  
  await Future.delayed(Duration(seconds: 5));
  
  var response = await ref.watch(apiProvider).request<dynamic>(
        '/editoriales.json',
        method: HttpMethod.put,
        body: editorialToJson(ref.read(listaEditorialesABMProvider)),
      );

  print(response.statusCode);

  if (response.error != null) {
    throw response.error!;
  }

  ref.invalidate(editorialesABMProvider);
});

final agregarEditorialProvider =
    FutureProvider.family<void, String>((ref, nombre) async {
  var response = await ref.watch(apiProvider).request<dynamic>(
        '/editoriales/${ref.read(listaEditorialesABMProvider).length}.json',
        method: HttpMethod.put,
        body: json.encode(Editorial(
                id: ref.read(listaEditorialesABMProvider).length,
                nombre: nombre)
            .toJson()),
      );

  if (response.error != null) {
    throw response.error!;
  }

  ref.invalidate(editorialesABMProvider);
});

final inputEditorialABMProvider = StateProvider<String>((ref) {
  return '';
});

final filtroEditorialProvider = Provider<List<Editorial>>((ref) {
  var editoriales =
      ref.watch(listaEditorialesABMProvider).map((e) => e.copyWith()).toList();
  var filtro = ref.watch(inputEditorialABMProvider);

  editoriales = editoriales
      .where((e) => e.nombre.toLowerCase().contains(filtro.toLowerCase()))
      .toList();

  return editoriales;
});

final listaEditorialesABMProvider =
    StateNotifierProvider<ListaEditorialesABMNotifier, List<Editorial>>((ref) {
  return ListaEditorialesABMNotifier();
});

class ListaEditorialesABMNotifier extends StateNotifier<List<Editorial>> {
  ListaEditorialesABMNotifier() : super([]);

  updateListaEditoriales(List<Editorial> autores) {
    state = autores;
  }

  deleteEditorial(int id) {
    state = state.where((e) => e.id != id).toList();
    state = [...state.map((e) => e.copyWith())];
  }

  modificarEditorial(int idEditorial, String nombreEditorial) {
    int index = state.indexOf(state.firstWhere((e) => e.id == idEditorial));
    state[index] = Editorial(id: idEditorial, nombre: nombreEditorial);
    state = [...state.map((e) => e.copyWith())];
  }
}
