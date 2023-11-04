import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/models/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/tipo_publicacion.repository.dart';

final getAllTipoPublicacionProvider = FutureProvider.autoDispose<List<TipoPublicacion>>((ref) async {
  
  var response = await ref
      .watch(apiProvider)
      .request<List<TipoPublicacion>>('/tipo-publicaciones', parser: tiposPublicacionesFromJson);

  if (response.error != null) {
    throw response;
  }

  return response.data!;
  // ref.read(tipoPublicacionProvider.notifier).update((_) => response.data!);
});
