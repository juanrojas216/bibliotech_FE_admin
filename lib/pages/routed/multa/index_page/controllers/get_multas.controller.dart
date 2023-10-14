import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dto/tabla_multa.dto.dart';
import '../dto/search_multa.dto.dart';

// final searchMultasProvider = FutureProvider.family<List<MultaItemTablaDto>, SearchMultaDto>((ref, dto) async {
final searchMultasProvider =
    FutureProvider<List<MultaItemTablaDto>>((ref) async {
  // var dto = ref.read(busquedaMultaProvider);

  // var response = await ref.watch(apiProvider).request<List<MultaItemTablaDto>>(
  //     '/publicaciones/search',
  //     method: HttpMethod.put,
  //     body: dto.toMap(),
  //     parser: multasTablaFromJson
  // );

  // if (response.error != null) {
  //   throw response.error!;
  // }

  // return response.data!;

  await Future.delayed(const Duration(seconds: 2));
  return List.generate(
      20,
      (index) => MultaItemTablaDto(
            id: index,
            idPrestamo: 'Prestamo $index',
            idUsuario: 'Usuario $index',
            fechaDesde: DateTime.now().add(Duration(days: index)),
            fechaHasta: DateTime.now().add(Duration(days: index * 2)),
            estado: 'Estado',
            tipo: 'Tipo',
          ));
});

final busquedaMultaProvider = StateProvider.autoDispose<SearchMultaDto>((ref) {
  return SearchMultaDto(
      idUsuario: null, idPrestamo: null, fechaDesde: null, fechaHasta: null);
});
