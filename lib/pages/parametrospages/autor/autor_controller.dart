import 'package:bibliotech_admin/new_models/autor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/api/http_admin.dart';

final autoresABMProvider = FutureProvider<void>((ref) async {
  var response = await ref.watch(apiProvider).request<List<Autor>>(
        '/autores.json',
        parser: autoresFromJson,
      );


  if (response.error != null) {
    throw response.error!;
  }

  ref.read(listaAutoresABMProvider.notifier).updateListaAutores(response.data!);
});

final eliminarAutorProvider = FutureProvider.family<void, int>((ref, id) async {
  // var response = await ref
  //     .watch(apiProvider)
  //     .request<bool>('/editoriales/delete', method: HttpMethod.delete, queryParameters: Map.from({'id': id}));

  await Future.delayed(const Duration(seconds: 5));

  var response = false;

  // if (response.error != null) {
  //   throw response.error!;
  // }

  // if (response.data == false) {
  //   throw response.error!;
  // }

  if (response == false) {
    throw response;
  }

  ref.read(listaAutoresABMProvider.notifier).deleteAutor(id);
});

final agregarAutorProvider =
    FutureProvider.family<void, Autor>((ref, autor) async {
  // var response = await ref
  //     .watch(apiProvider)
  //     .request<bool>('/editoriales/delete', method: HttpMethod.delete, queryParameters: Map.from({'id': id}));

  await Future.delayed(const Duration(seconds: 5));

  var response = false;

  // if (response.error != null) {
  //   throw response.error!;
  // }

  // if (response.data == false) {
  //   throw response.error!;
  // }

  if (response == false) {
    throw response;
  }

  ref.invalidate(autoresABMProvider);
});

final inputAutorABMProvider = StateProvider<String>((ref) {
  return '';
});

final filtroAutorProvider = Provider<List<Autor>>((ref) {
  var autores =
      ref.watch(listaAutoresABMProvider).map((e) => e.copyWith()).toList();
  var filtro = ref.watch(inputAutorABMProvider);

  autores = autores
      .where((a) => a.nombre.toLowerCase().contains(filtro.toLowerCase()))
      .toList();

  return autores;
});

final listaAutoresABMProvider =
    StateNotifierProvider<ListaAutoresABMNotifier, List<Autor>>((ref) {
  return ListaAutoresABMNotifier();
});

class ListaAutoresABMNotifier extends StateNotifier<List<Autor>> {
  ListaAutoresABMNotifier() : super([]);

  updateListaAutores(List<Autor> autores) {
    state = autores;
  }

  deleteAutor(int id) {
    state = state.where((a) => a.id != id).toList();
    state = [...state.map((a) => a.copyWith())];
  }
}
