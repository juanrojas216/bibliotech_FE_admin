import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dto/parametro_prestamo.dto.dart';
import 'get_parametros_prestamo.controller.dart';

final updateParametroPrestamoProvider = FutureProvider.family<void, ParametrosPrestamoDto>((ref, parametro) async {
  
  var response = await ref.watch(apiProvider).request(
        '/parametro-prestamo',
        method: HttpMethod.put,
        body: parametroPrestamoToJson(parametro),
      );

  if (response.error != null) {
    throw response.error!;
  }

  ref.invalidate(getParametrosPrestamoProvider);
});
