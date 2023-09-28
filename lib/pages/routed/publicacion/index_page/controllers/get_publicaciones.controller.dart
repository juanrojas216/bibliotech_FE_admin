import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/new_models/index.dart';
import 'package:bibliotech_admin/new_models/publicacion.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_logger/simple_logger.dart';

import '../dto/search_publicacion.dto.dart';
import '../repositoy/publicaciones.repository.dart';

final searchPublicacionesProvider = FutureProvider.family<void, SearchPublicacionDto>((ref, dto) async {
  
  var response = await ref.watch(apiProvider).request<List<Publicacion>>(
      '/publicaciones',
      // '/publicaciones/searchByParams',
      // body: dto.toMap(),
      parser: publicacionesFromJson
  );

  if (response.error != null) {
    throw response.error!;
  }

  var logger = SimpleLogger();
  logger.info(response.data!.length);

  ref.read(publicacionesProvider.notifier).update((state) => response.data!);
});
