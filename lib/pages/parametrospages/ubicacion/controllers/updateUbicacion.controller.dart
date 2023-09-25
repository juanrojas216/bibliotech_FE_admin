import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/new_models/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/ubicacion/repository/ubicaciones.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updateUbicacionProvider = FutureProvider.family<void, Ubicacion>((ref, ubicacion) async {
  var response = await ref.watch(apiProvider).request(
        '/ubicaciones/${ubicacion.id}',
        method: HttpMethod.put,
        body: ubicacionToJson(ubicacion),
      );

  if (response.error != null) {
    throw response.error!;
  }

  ref.read(ubicacionesProvider.notifier).update((value) => value.map((a) {
        if (a.id == ubicacion.id) return ubicacion;
        return a;
      }).toList());
});
