import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_logger/simple_logger.dart';

import '../dto/tabla_multa.dto.dart';
import '../dto/search_multa.dto.dart';
import '../repositoy/multas.repository.dart';

final searchMultasProvider = FutureProvider.family<void, SearchMultaDto>((ref, dto) async {
  
  var response = await ref.watch(apiProvider).request<List<MultaItemTablaDto>>(
      '/publicaciones/search',
      method: HttpMethod.put,
      body: dto.toMap(),
      parser: multasTablaFromJson
  );

  if (response.error != null) {
    throw response.error!;
  }

  var logger = SimpleLogger();
  logger.info(response.data!.length);

  ref.read(multasTablaProvider.notifier).update((state) => response.data!);
});
