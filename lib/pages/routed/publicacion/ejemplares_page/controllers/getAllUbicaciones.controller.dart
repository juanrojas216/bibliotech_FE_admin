
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/new_models/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/ubicaciones.repository.dart';

final getAllUbicacionLibreProvider = FutureProvider<void>((ref) async {
  var response = await ref.watch(apiProvider).request<List<Ubicacion>>(
        '/ubicaciones',
        parser: ubicacionesFromJson,
  );

  if (response.error != null) {
    throw response.error!;
  }

  var ubicaiones = response.data!.where((e) => !e.ocupada).toList();

  ref.read(ubicacionesProvider.notifier).update((_) => ubicaiones,);
});