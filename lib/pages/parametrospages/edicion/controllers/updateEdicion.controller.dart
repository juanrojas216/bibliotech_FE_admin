import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/models/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/edicion/repository/ediciones.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updateEdicionProvider =
    FutureProvider.family<void, Edicion>((ref, edicion) async {
  var response = await ref.watch(apiProvider).request<Map<String, dynamic>>(
        '/ediciones/${edicion.id}',
        method: HttpMethod.put,
        body: edicionToJson(edicion),
      );

  if (response.error != null) {
    throw response.error!;
  }

  ref.read(edicionesProvider.notifier).update((value) => value.map((e) {
        if (e.id == edicion.id) return edicion;
        return e;
      }).toList());
});
