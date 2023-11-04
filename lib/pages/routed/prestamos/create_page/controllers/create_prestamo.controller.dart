

import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../index_page/controllers/get_prestamos.controller.dart';
import '../dto/create_prestamo.dto.dart';


final createPrestamoProvider = FutureProvider.family<void, CreatePrestamoDto>((ref, prestamoDto) async {
  
  var response = await ref.watch(apiProvider).request(
    '/prestamos/crearPrestamo',
    method: HttpMethod.post,
    body: prestamoDto.toMap(),
  );

  if (response.error != null) {
    throw response;
  }

  ref.invalidate(searchPrestamosProvider);
});