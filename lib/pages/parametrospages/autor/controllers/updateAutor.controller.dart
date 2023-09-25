import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/new_models/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/autor/repository/autores.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updateAutorProvider = FutureProvider.family<void, Autor>((ref, autor) async {
  var response = await ref.watch(apiProvider).request(
        '/autores/${autor.id}',
        method: HttpMethod.put,
        body: autorToJson(autor),
      );

  if (response.error != null) {
    throw response.error!;
  }

  ref.read(autoresProvider.notifier).update((value) => value.map((a) {
        if (a.id == autor.id) return autor;
        return a;
      }).toList());
});
