

import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dto/create_prestamo.dto.dart';


final createPrestamoProvider = FutureProvider.family<void, CreatePrestamoDto>((ref, prestamoDto) async {
  
  var response = await ref.watch(apiProvider).request(
    '/crearPrestamo',
    method: HttpMethod.post,
    body: prestamoDto.toMap(),
  );

  if (response.error != null) {
    throw response.error!;
  }

  // ref.invalidate(searchPrestamosProvider);
});