import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dto/parametro_prestamo.dto.dart';


final getParametrosPrestamoProvider = FutureProvider<ParametrosPrestamoDto>((ref) async {
  
  ParametrosPrestamoDto pm = ParametrosPrestamoDto(diasMaximoPrestamo: null, diasMaximoRenovacion: null, cantidadMaximaRenovacion: null);
  
  var response = await ref.watch(apiProvider).request<String>(
      '/parametros/cantidadMaxDiasPrestamo',
      parser: (data) {
        Map<String, dynamic> mp = data;
        return mp["valor"];
      },
  );

  if (response.error != null) {
    throw response.error!;
  }

  pm.diasMaximoPrestamo = int.parse(response.data!);

  response = await ref.watch(apiProvider).request<String>(
      '/parametros/cantidadMaxDiasRenovacion',
      parser: (data) {
        Map<String, dynamic> mp = data;
        return mp["valor"];
      },
  );

  if (response.error != null) {
    throw response.error!;
  }

  pm.diasMaximoRenovacion = int.parse(response.data!);

  response = await ref.watch(apiProvider).request<String>(
      '/parametros/cantidadMaxRenovaciones',
      parser: (data) {
        Map<String, dynamic> mp = data;
        return mp["valor"];
      },
  );

  if (response.error != null) {
    throw response.error!;
  }

  pm.cantidadMaximaRenovacion = int.parse(response.data!);

  return pm;
});
