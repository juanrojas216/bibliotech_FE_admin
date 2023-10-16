import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dto/parametro_prestamo.dto.dart';


final getParametrosPrestamoProvider = FutureProvider<ParametrosPrestamoDto>((ref) async {
  
  // var response = await ref.watch(apiProvider).request<ParametrosPrestamoDto>(
  //     '/parametro-prestamo',
  //     parser: parametroPrestamoFromJson
  // );

  // if (response.error != null) {
  //   throw response.error!;
  // }

  // return response.data!;

  return ParametrosPrestamoDto(diasMaximoPrestamo: 10, diasMaximoRenovacion: 5, cantidadMaximaRenovacion: 2);
});
