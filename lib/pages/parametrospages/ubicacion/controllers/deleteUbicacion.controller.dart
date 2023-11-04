import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/pages/parametrospages/ubicacion/repository/ubicaciones.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deleteUbicacionProvider = FutureProvider.family<void, int>((ref, id) async {
  
  var response = await ref.watch(apiProvider).request(
        '/ubicaciones/$id',
        method: HttpMethod.delete,
  );

  if (response.error != null) {
    throw response;
  }

  ref.read(ubicacionesProvider.notifier).update((value) {
    return value.where((e) => e.id != id).toList();
  });
});
