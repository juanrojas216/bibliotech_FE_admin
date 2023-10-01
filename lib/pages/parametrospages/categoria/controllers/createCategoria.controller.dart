

import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/new_models/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/categoria/dto/categoria.dto.dart';
import 'package:bibliotech_admin/pages/parametrospages/categoria/repository/categorias.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_logger/simple_logger.dart';


final createCategoriaProvider = FutureProvider.family<void, CategoriaDto>((ref, categoriaDto) async {
  
  var response = await ref.watch(apiProvider).request(
    '/categorias',
    method: HttpMethod.post,
    body: categoriaDto.toMap(),
    parser: categoriaFromJson,
  );

  if (response.error != null) {
    var logger = SimpleLogger();
    logger.severe(response.error!.exception);
    throw response.error!;
  }

  ref.read(categoriasProvider.notifier).update((state) {
    state = [ ...state, response.data!];
    return state;
  });
});