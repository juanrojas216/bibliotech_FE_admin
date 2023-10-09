
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/models/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/categoria/repository/categorias.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_logger/simple_logger.dart';

final getAllCategoriasProvider = FutureProvider<void>((ref) async {
  var response = await ref.watch(apiProvider).request<List<Categoria>>(
        '/categorias',
        parser: categoriasFromJson,
  );

  if (response.error != null) {
    var logger = SimpleLogger();
    logger.info(response.error!.exception);
    logger.info(response.error!.data);
    throw response.error!;
  }

  ref.read(categoriasProvider.notifier).update((_) => response.data!,);
});