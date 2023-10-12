import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dto/detalleUsuario.dto.dart';

final getDetalleUsuarioProvider = FutureProvider.family<DetalleUsuarioDto, int>((ref, id) async {

var response = await ref.watch(apiProvider).request<DetalleUsuarioDto>(
      '/users/$id',
      parser: detalleUsuarioFromJson,
);

if (response.error != null) {
  throw response.error!;
}

  return response.data!;

});
