
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/new_models/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/categoria/repository/categorias.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_logger/simple_logger.dart';

final getAllCategoriasProvider = FutureProvider<void>((ref) async {
  var response = await ref.watch(apiProvider).request<List<Categoria>>(
        '/categorias',
        parser: categoriasFromJson,
  );

  if (response.error != null) {
    throw response.error!;
  } else {
    var logger = SimpleLogger();
    logger.info(categoriasToJson(response.data!));
  }

  ref.read(categoriasProvider.notifier).update((_) => response.data!,);
});