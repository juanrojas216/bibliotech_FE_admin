import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dto/detalle_prestamo.dto.dart';

final getDetallePrestamoProvider = FutureProvider.family<DetallePrestamoDto, int>((ref, id) async {
  
  var response = await ref
      .watch(apiProvider)
      .request<DetallePrestamoDto>('/prestamos/detalle/$id', parser: detallePrestamoFromJson);

  if (response.error != null) {
    throw response;
  }

  return response.data!;

});