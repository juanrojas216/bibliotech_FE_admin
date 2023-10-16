import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dto/renovar_prestamo.dto.dart';
import 'get_prestamos.controller.dart';

final renovarPrestamoProvider = FutureProvider.family<void, RenovarPrestamoDto>((ref, dto) async {
  
  var response = await ref.watch(apiProvider).request(
        '/renovar-prestamo/${dto.idPrestamo}',
        method: HttpMethod.put,
        body: renovarPrestamoToJson(dto),
      );

  if (response.error != null) {
    throw response.error!;
  }

  ref.invalidate(searchPrestamosProvider);
});