import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/new_models/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updatePublicacionProvider = FutureProvider.family<void, Publicacion>((ref, publicacion) async {
  var response = await ref.watch(apiProvider).request(
        '/publicaciones/${publicacion.id}',
        method: HttpMethod.put,
        body: publicacionToJson(publicacion),
      );

  if (response.error != null) {
    throw response.error!;
  }

});
