import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/pages/routed/prestamos/index_page/dto/estado_prestamo.dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_logger/simple_logger.dart';

import 'get_prestamos.controller.dart';

final updateEstadoPrestamoProvider =
    FutureProvider.family<void, EstadoPrestamoDto>((ref, dto) async {
  var response = await ref.watch(apiProvider).request<void>(
      '/estado-prestamo/${dto.idPrestamo}',
      method: HttpMethod.put,
      body: estadoPrestamoToJson(dto));

  if (response.error != null) {
    var logger = SimpleLogger();
    logger.warning(response.error!.exception);
    throw response.error!;
  }

  ref.invalidate(searchPrestamosProvider);
});
