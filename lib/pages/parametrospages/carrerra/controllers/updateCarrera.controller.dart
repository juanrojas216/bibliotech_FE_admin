import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/new_models/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/carreras.repository.dart';

final updateCarreraProvider =
    FutureProvider.family<void, Carrera>((ref, carrera) async {
  var response = await ref.watch(apiProvider).request<Map<String, dynamic>>(
        '/carreras/${carrera.id}',
        method: HttpMethod.put,
        body: carreraToJson(carrera),
      );

  if (response.error != null) {
    throw response.error!;
  }

  ref.read(carrerasProvider.notifier).update((value) => value.map((c) {
        if (c.id == carrera.id) return carrera;
        return c;
      }).toList());
});
