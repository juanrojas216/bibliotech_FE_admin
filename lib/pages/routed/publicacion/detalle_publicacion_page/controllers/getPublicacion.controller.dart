import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/models/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_logger/simple_logger.dart';

import '../repository/publicacion.repository.dart';

final getPublicacionProvider = FutureProvider.family.autoDispose<Publicacion, int>((ref, id) async {
  
  var response = await ref
      .watch(apiProvider)
      .request<Publicacion>('/publicaciones/$id',
      parser: publicacionFromJson
  );

  if (response.error != null) {
    var logger = SimpleLogger();
    logger.warning(response.data);
    logger.warning(response.error!.exception);
    logger.warning(response.error!.data);
    throw response;
  }

  return response.data!;

  // ref.read(publicacionProvider.notifier).actualizarPublicacion(response.data!);
});
