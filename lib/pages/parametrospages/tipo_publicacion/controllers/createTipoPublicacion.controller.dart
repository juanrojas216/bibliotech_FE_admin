

import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/new_models/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/tipo_publicacion/repository/tiposPublicacion.respository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final createTipoPublicacionProvider = FutureProvider.family<void, String>((ref, titulo) async {
  
  var response = await ref.watch(apiProvider).request(
    '/tipo-publicaciones',
    method: HttpMethod.post,
    body: {"nombre": titulo},
    parser: tipoPublicacionFromJson,
  );

  if (response.error != null) {
    throw response.error!;
  }

  ref.read(tiposPublicacionProvider.notifier).update((state) {
    state = [ ...state, response.data!];
    return state;
  });
});