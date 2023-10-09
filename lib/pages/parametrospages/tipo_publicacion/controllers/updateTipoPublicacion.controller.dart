import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/models/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/tipo_publicacion/repository/tiposPublicacion.respository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updateTipoPublicacionProvider =
    FutureProvider.family<void, TipoPublicacion>((ref, tipoPublicacion) async {
  var response = await ref.watch(apiProvider).request<Map<String, dynamic>>(
        '/tipo-publicaciones/${tipoPublicacion.id}',
        method: HttpMethod.put,
        body: tipoPublicacionToJson(tipoPublicacion),
      );

  if (response.error != null) {
    throw response.error!;
  }

  ref.read(tiposPublicacionProvider.notifier).update((value) => value.map((tp) {
        if (tp.id == tipoPublicacion.id) return tipoPublicacion;
        return tp;
      }).toList());
});
