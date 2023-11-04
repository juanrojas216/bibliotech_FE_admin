import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/pages/parametrospages/autor/repository/autores.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deleteAutorProvider = FutureProvider.family<void, int>((ref, id) async {
  
  var response = await ref.watch(apiProvider).request(
        '/autores/$id',
        method: HttpMethod.delete,
  );

  if (response.error != null) {
    throw response;
  }

  ref.read(autoresProvider.notifier).update((value) {
    return value.where((e) => e.id != id).toList();
  });
});
