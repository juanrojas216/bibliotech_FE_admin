import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/new_models/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/detallep.repository.dart';


final getPublicacionProvider = FutureProvider.family<void, int>((ref, id) async {
  var response = await ref.watch(apiProvider).request<Publicacion>(
        '/publicaciones/$id',
        parser: publicacionFromJson,
  );

  if (response.error != null) {
    throw response.error!;
  }

  ref.read(detallePublicacionProvider.notifier).actualizarDetallePublicacion(response.data!);
});