import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'getAllComentariosPublicacion.controller.dart';

final deleteComentarioProvider = FutureProvider.family<void, int>((ref, id) async {
  
  var response = await ref.watch(apiProvider).request(
        '/comentarios/$id',
        method: HttpMethod.delete,
  );

  if (response.error != null) {
    throw response.error!;
  }

  ref.invalidate(getAllComentariosPublicacionProvider);
});