import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_logger/simple_logger.dart';

import '../dto/tabla_multa.dto.dart';
import '../dto/search_multa.dto.dart';

final searchMultasProvider = FutureProvider.autoDispose<List<MultaItemTablaDto>>((ref) async {
// final searchMultasProvider =
//     FutureProvider<List<MultaItemTablaDto>>((ref) async {
  var dto = ref.read(busquedaMultaProvider);

  if (dto.fechaDesde == null && dto.fechaHasta == null && dto.idPrestamo == null && dto.idUsuario == null) {
    return [];    
  }

  var response = await ref.watch(apiProvider).request<List<MultaItemTablaDto>>(
      '/multas/findByParams',
      method: HttpMethod.post,
      body: dto.toMap(),
      parser: multasTablaFromJson
  );

  if (response.error != null) {
    var logger = SimpleLogger();
    logger.warning(response.statusCode);
    throw response;
  }

  return response.data!;

  // await Future.delayed(const Duration(seconds: 2));
  // return List.generate(
  //     20,
  //     (index) => MultaItemTablaDto(
  //           id: index,
  //           idPrestamo: 'Prestamo $index',
  //           idUsuario: 'Usuario $index',
  //           fechaDesde: DateTime.now().add(Duration(days: index)),
  //           fechaHasta: DateTime.now().add(Duration(days: index * 2)),
  //           estado: 'Estado',
  //           tipo: 'Tipo',
  //         ));
});

final busquedaMultaProvider = StateProvider.autoDispose<SearchMultaDto>((ref) {
  return SearchMultaDto(
      idUsuario: null, idPrestamo: null, fechaDesde: null, fechaHasta: null);
});
