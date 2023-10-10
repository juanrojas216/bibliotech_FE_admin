import 'dart:convert';
import 'dart:js_interop';

import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_logger/simple_logger.dart';

import '../dto/publicacion.dto.dart';
import '../repositoy/publicaciones.repository.dart';
import '../repositoy/search.repository.dart';

final searchPublicacionesProvider = FutureProvider<void>((ref) async {
  
  var dto = ref.watch(searchPublicacionRepositoryProvider);

  if(dto.isNull) {
    return;
  } 

  var response = await ref.watch(apiProvider).request<List<PublicacionDto>>(
      '/publicaciones/findByParams',
      method: HttpMethod.post,
      body: dto!.toMap(),
      parser: publicacionesFromJson
  );

  var logger = SimpleLogger();
  logger.info(dto.toMap());

  if (response.error != null) {
    logger.warning("error");
    logger.warning(response.error!.data);
    throw response.error!;
  }

  // var logger = SimpleLogger();
  // logger.info(response.data!.length);

  ref.read(publicacionesProvider.notifier).update((state) => response.data!);
});
