import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/models/ediciones.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/detalle_page/detalle_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final edicionesProvider = FutureProvider<List<Edicion>>((ref) async {
  var response = await ref
      .watch(apiProvider)
      .request<List<Edicion>>('/ediciones.json', parser: edicionFromJson);

  if (response.error != null) {
    throw response.error!;
  }

  var detallePublicacion = ref.watch(detallePublicacionProvider);
  bool detalleOk = response.data!
      .where((e) => e.id == detallePublicacion.edicion!.id)
      .isNotEmpty;
  if (detalleOk) {
    return response.data!;
  }
  return [...response.data!, detallePublicacion.edicion!];
});
