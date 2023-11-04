import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/pages/parametrospages/categoria/repository/categorias.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deleteValorProvider = FutureProvider.family<void, int>((ref, id) async {
  
  var response = await ref.watch(apiProvider).request(
        '/categoria-valores/$id',
        method: HttpMethod.delete,
  );

  if (response.error != null) {
    throw response;
  }

  ref.read(categoriasProvider.notifier).update((value) {
    for (var c in value) {
      c.valores = c.valores.where((v) => v.id != id).toList();
    }
    return [...value];
  });
});
