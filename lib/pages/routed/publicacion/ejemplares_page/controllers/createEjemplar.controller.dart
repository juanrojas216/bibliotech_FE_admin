import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/models/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_logger/simple_logger.dart';

import '../dto/create_ejemplar.dto.dart';
import 'getAllEjemplares.controller.dart';

final createEjemplarProvider =
    FutureProvider.family<void, EjemplarDto>((ref, dto) async {
  var response = await ref.watch(apiProvider).request(
        '/ejemplares',
        method: HttpMethod.post,
        body: dto.toMap(),
      );

  if (response.error != null) {
    var logger = SimpleLogger();
    logger.warning(response.error!.exception);
    throw response;
  }

  ref.invalidate(getAllEjemplaresProvider);

  // ref.read(ejemplaresProvider.notifier).update((state) => [...state, response.data!]);
});
