import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_logger/simple_logger.dart';

import '../dto/parametro_prestamo.dto.dart';
import '../dto/validar_renovacion.dto.dart';

final validarRenovacionPrestamoProvider = FutureProvider.family<Map, int>((ref, id) async {
  
  // var renovacion = await ref
  //     .watch(apiProvider)
  //     .request<ValidarRenovacionPrestamoDto>(
  //         '/renovacion-prestamo-validacion/$id',
  //         parser: validarRenovacionPrestamoFromJson);

  // if (renovacion.error != null) {
  //   var logger = SimpleLogger();
  //   logger.warning(renovacion.error!.exception);
  //   throw renovacion.error!;
  // }

  // var diasMaximos = await ref.watch(apiProvider).request<ParametrosPrestamoDto>(
  //     '/parametro-prestamo',
  //     parser: parametroPrestamoFromJson
  // );

  // if (diasMaximos.error != null) {
  //   var logger = SimpleLogger();
  //   logger.warning(diasMaximos.error!.exception);
  //   throw diasMaximos.error!;
  // }

  // var response = {
  //   "renovacion": renovacion,
  //   "diasMaximo": diasMaximos.data!.diasMaximoRenovacion,
  // };
  
  var response = {
    "renovacion": ValidarRenovacionPrestamoDto(cantidadRenovacionesDispoibles: 2, fechaFinalizacionPrevista: "01-11-2023"),
    "diasMaximo": 5
  };

  return response;
});
