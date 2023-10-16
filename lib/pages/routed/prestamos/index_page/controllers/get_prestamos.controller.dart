// import 'package:bibliotech_admin/config/api/http_admin.dart';
// import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dto/tabla_prestamo.dto.dart';
import '../dto/search_prestamo.dto.dart';

// final searchMultasProvider = FutureProvider.family<List<MultaItemTablaDto>, SearchMultaDto>((ref, dto) async {
final searchPrestamosProvider =
    FutureProvider<List<PrestamoItemTablaDto>>((ref) async {
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
      (index) => PrestamoItemTablaDto(
            id: index,
            tituloPublicacion: "Publicacion $index",
            idEjemplar: 'Ejemplar $index',
            idUsuario: 'Usuario $index',
            fechaDesde: DateTime.now().add(Duration(days: index)),
            fechaHasta: DateTime.now().add(Duration(days: index * 2)),
            estado: 'Estado',
          ));
});

final busquedaPrestamoProvider = StateProvider.autoDispose<SearchPrestamoDto>((ref) {
  return SearchPrestamoDto(
    dni: null,
    tituloPublicacion: null,
    fechaDesde: null,
    fechaHasta: null,
  );
});
