
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/new_models/tipo_publicacion.dart';
// import 'package:bibliotech_admin/models/tipos_publicacion.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'detalle_controller.dart';

final tiposProvider = FutureProvider<List<TipoPublicacion>>((ref) async {

  var response = await ref
      .watch(apiProvider)
      .request<List<TipoPublicacion>>('/tipos_publicacion.json', parser: tiposPublicacionesFromJson);

  if (response.error != null) {
    throw response.error!;
  }

  var detallePublicacion = ref.watch(detallePublicacionProvider);
  bool tipoOK = response.data!
      .where((t) => t.id == detallePublicacion.tipo.id)
      .isNotEmpty;
  if (tipoOK) {
    return response.data!;
  }
  return [...response.data!, detallePublicacion.tipo];

});