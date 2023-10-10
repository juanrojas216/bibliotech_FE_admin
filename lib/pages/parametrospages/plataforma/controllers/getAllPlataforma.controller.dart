import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/models/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/plataforma/repository/plataformas.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_logger/simple_logger.dart';

final getAllPlataformasProvider = FutureProvider.autoDispose<void>((ref) async {
  
  var response = await ref
      .watch(apiProvider)
      .request<List<Plataforma>>('/plataformas', parser: plataformasFromJson);

  if (response.error != null) {
    var logger = SimpleLogger();
    logger.info(response.error!.exception);
    logger.info(response.error!.data);
    throw response.error!;
  }

  ref.read(plataformasProvider.notifier).update((state) => response.data!);
});
