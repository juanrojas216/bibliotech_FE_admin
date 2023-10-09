import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/models/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/facultad/repository/facultades.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updateFacultadProvider =
    FutureProvider.family<void, Facultad>((ref, facultad) async {
  var response = await ref.watch(apiProvider).request<Map<String, dynamic>>(
        '/facultades/${facultad.id}',
        method: HttpMethod.put,
        body: facultadToJson(facultad),
      );

  if (response.error != null) {
    throw response.error!;
  }

  ref.read(facultadesProvider.notifier).update((value) => value.map((f) {
        if (f.id == facultad.id) return facultad;
        return f;
      }).toList());
});
