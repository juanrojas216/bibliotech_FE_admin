import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dto/parametro_prestamo.dto.dart';

final updateParametroPrestamoProvider = FutureProvider.family<void, ParametrosPrestamoDto>((ref, parametro) async {
  
  var response = await ref.watch(apiProvider).request(
        '/parametros/cantidadMaxDiasPrestamo',
        method: HttpMethod.post,
        body: parametro.diasMaximoPrestamo,
      );

  if (response.error != null) {
    throw response;
  }

  response = await ref.watch(apiProvider).request(
        '/parametros/cantidadMaxDiasRenovacion',
        method: HttpMethod.post,
        body: parametro.diasMaximoRenovacion,
      );

  if (response.error != null) {
    throw response.error!;
  }

  response = await ref.watch(apiProvider).request(
        '/parametros/cantidadMaxRenovaciones',
        method: HttpMethod.post,
        body: parametro.cantidadMaximaRenovacion,
      );

  if (response.error != null) {
    throw response.error!;
  }  

});
