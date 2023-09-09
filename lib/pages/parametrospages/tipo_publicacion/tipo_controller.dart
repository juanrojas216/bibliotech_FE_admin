import 'dart:convert';

import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/models/tipos_publicacion.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tipoPublicacionABMProvider = FutureProvider<void>((ref) async {
  var response = await ref
      .watch(apiProvider)
      .request<List<TipoPublicacion>>('/tipos_publicacion.json', parser: tipoPublicacionFromJson);

  if (response.error != null) {
    throw response.error!;
  }

  ref
      .read(listaTipoPublicacionABMProvider.notifier)
      .updateListaTipoPublicaciones(response.data!);
});

final eliminarTipoPublicacionProvider = FutureProvider<void>((ref) async {
  var response = await ref.watch(apiProvider).request<dynamic>(
        '/tipos_publicacion.json',
        method: HttpMethod.put,
        body: tipoPublicacionToJson(
          ref.read(listaTipoPublicacionABMProvider),
        ),
      );

  if (response.error != null) {
    throw response.error!;
  }

  ref.invalidate(tipoPublicacionABMProvider);
});

final modificarTipoPublicacionProvider = FutureProvider<void>((ref) async {
  
  var response = await ref.watch(apiProvider).request<dynamic>(
        '/tipos_publicacion.json',
        method: HttpMethod.put,
        body: tipoPublicacionToJson(ref.read(listaTipoPublicacionABMProvider)),
      );


  if (response.error != null) {
    throw response.error!;
  }

  ref.invalidate(tipoPublicacionABMProvider);
});

final agregarTipoPublicacionProvider =
    FutureProvider.family<void, String>((ref, nombre) async {
  var response = await ref.watch(apiProvider).request<dynamic>(
        '/tipos_publicacion/${ref.read(listaTipoPublicacionABMProvider).length}.json',
        method: HttpMethod.put,
        body: json.encode(TipoPublicacion(
                id: ref.read(listaTipoPublicacionABMProvider).length,
                nombre: nombre)
            .toJson()),
      );

  if (response.error != null) {
    throw response.error!;
  }

  ref.invalidate(tipoPublicacionABMProvider);
});

final inpuTipoPublicacionABMProvider = StateProvider<String>((ref) {
  return '';
});

final filtroTipoPublicacionProvider = Provider<List<TipoPublicacion>>((ref) {
  
  var tipos = ref.watch(listaTipoPublicacionABMProvider).map((e) => e.copyWith()).toList();
  var filtro = ref.watch(inpuTipoPublicacionABMProvider);

  tipos = tipos
      .where((e) => e.nombre.toLowerCase().contains(filtro.toLowerCase()))
      .toList();

  return tipos;
});

final listaTipoPublicacionABMProvider =
    StateNotifierProvider<ListaTipoPublicacionABMNotifier, List<TipoPublicacion>>((ref) {
  return ListaTipoPublicacionABMNotifier();
});

class ListaTipoPublicacionABMNotifier extends StateNotifier<List<TipoPublicacion>> {
  ListaTipoPublicacionABMNotifier() : super([]);

  updateListaTipoPublicaciones(List<TipoPublicacion> tipoPublicaciones) {
    state = tipoPublicaciones;
  }

  deleteTipoPublicacion(int id) {
    state = state.where((e) => e.id != id).toList();
    state = [...state.map((e) => e.copyWith())];
  }

  modificarTipoPublicacion(int idTipo, String nombreTipo) {
    int index = state.indexOf(state.firstWhere((e) => e.id == idTipo));
    state[index] = TipoPublicacion(id: idTipo, nombre: nombreTipo);
    state = [...state.map((e) => e.copyWith())];
  }
}
