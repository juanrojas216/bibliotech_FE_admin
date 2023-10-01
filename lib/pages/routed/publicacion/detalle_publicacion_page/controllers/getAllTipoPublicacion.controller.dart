import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/new_models/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/tipo_publicacion.repository.dart';

final getAllTipoPublicacionProvider = FutureProvider<void>((ref) async {
  
  var response = await ref
      .watch(apiProvider)
      .request<List<TipoPublicacion>>('/tipo-publicaciones', parser: tiposPublicacionesFromJson);

  if (response.error != null) {
    throw response.error!;
  }

  ref.read(tipoPublicacionProvider.notifier).update((_) => response.data!);
});
