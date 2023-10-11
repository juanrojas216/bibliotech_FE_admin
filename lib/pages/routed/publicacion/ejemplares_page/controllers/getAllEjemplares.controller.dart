import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/models/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_logger/simple_logger.dart';

import '../repository/ejemplares.repository.dart';

final getAllEjemplaresProvider = FutureProvider.family<void, int>((ref, id) async {
  
  var response = await ref.watch(apiProvider).request<List<Ejemplar>>(
        '/ejemplares/$id',
        parser: ejemplaresFromJson,
  );

  if (response.error != null) {
    var logger = SimpleLogger();
    logger.warning(response.error!.data);
    throw response.error!;
  }

  ref.read(ejemplaresProvider.notifier).update((_) => response.data!);
});