import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_logger/simple_logger.dart';

import '../dto/publicacion.dto.dart';
import '../dto/search_publicacion.dto.dart';
import '../repositoy/publicaciones.repository.dart';

final searchPublicacionesProvider = FutureProvider.family<void, SearchPublicacionDto>((ref, dto) async {
  
  var response = await ref.watch(apiProvider).request<List<PublicacionDto>>(
      '/publicaciones/search',
      body: dto.toMap(),
      parser: publicacionesFromJson
  );

  if (response.error != null) {
    throw response.error!;
  }

  var logger = SimpleLogger();
  logger.info(response.data!.length);

  ref.read(publicacionesProvider.notifier).update((state) => response.data!);
});
