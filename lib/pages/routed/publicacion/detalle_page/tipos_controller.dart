
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/models/tipos_publicacion.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tiposProvider = FutureProvider<List<TipoPublicacion>>((ref) async {
  await Future.delayed(const Duration(seconds: 5));

  var response = await ref
      .watch(apiProvider)
      .request<List<TipoPublicacion>>('/tipos_publicacion.json', parser: tipoPublicacionFromJson);

  if (response.error != null) {
    throw response.error!;
  }

  return response.data!;
});