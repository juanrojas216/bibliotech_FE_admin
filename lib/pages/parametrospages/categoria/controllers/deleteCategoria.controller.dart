import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/pages/parametrospages/categoria/repository/categorias.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deleteCategoriaProvider = FutureProvider.family<void, int>((ref, id) async {
  
  var response = await ref.watch(apiProvider).request(
        '/categorias/$id',
        method: HttpMethod.delete,
  );

  if (response.error != null) {
    throw response.error!;
  }

  ref.read(categoriasProvider.notifier).update((value) {
    return value.where((e) => e.id != id).toList();
  });
});
