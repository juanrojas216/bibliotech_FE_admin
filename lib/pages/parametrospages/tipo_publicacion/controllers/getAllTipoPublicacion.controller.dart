import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/models/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/tipo_publicacion/repository/tiposPublicacion.respository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getAllTipoPublicacionProvider = FutureProvider.autoDispose<void>((ref) async {
  
  var response = await ref
      .watch(apiProvider)
      .request<List<TipoPublicacion>>('/tipo-publicaciones', parser: tiposPublicacionesFromJson);

  if (response.error != null) {
    throw response;
  }

  ref.read(tiposPublicacionProvider.notifier).update((state) => response.data!);
});
