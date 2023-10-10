
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/models/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/ubicacion/repository/ubicaciones.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getAllUbicacionProvider = FutureProvider.autoDispose<void>((ref) async {
  var response = await ref.watch(apiProvider).request<List<Ubicacion>>(
        '/ubicaciones',
        parser: ubicacionesFromJson,
  );

  if (response.error != null) {
    throw response.error!;
  }

  ref.read(ubicacionesProvider.notifier).update((_) => response.data!,);
});