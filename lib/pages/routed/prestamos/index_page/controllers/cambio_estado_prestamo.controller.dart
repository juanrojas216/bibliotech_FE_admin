import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_logger/simple_logger.dart';

import 'get_prestamos.controller.dart';

final updateEstadoPrestamoProvider = FutureProvider.family<void, String>((ref, endpoint) async {
  var response = await ref.watch(apiProvider).request<void>(
      endpoint,
      method: HttpMethod.patch,
    );

  if (response.error != null) {
    var logger = SimpleLogger();
    logger.warning(response.error!.exception);
    throw response;
  }

  ref.invalidate(searchPrestamosProvider);
});
