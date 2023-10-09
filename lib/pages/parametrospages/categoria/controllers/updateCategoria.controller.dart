import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/models/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/categoria/repository/categorias.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_logger/simple_logger.dart';

final updateCategoriaProvider = FutureProvider.family<void, Categoria>((ref, categoria) async {
  var response = await ref.watch(apiProvider).request(
        '/categorias/${categoria.id}',
        method: HttpMethod.put,
        body: categoriaToJson(categoria),
      );

  if (response.error != null) {
    var logger = SimpleLogger();
    logger.severe(response.error!.exception);
    logger.warning(response.error!.data);
    throw response.error!;
  }

  ref.read(categoriasProvider.notifier).update((value) => value.map((c) {
        if (c.id == categoria.id) return categoria;
        return c;
      }).toList());
});
