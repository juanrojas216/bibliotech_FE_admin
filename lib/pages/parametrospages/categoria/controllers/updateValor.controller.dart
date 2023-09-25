import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/new_models/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/categoria/repository/categorias.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updateValorProvider = FutureProvider.family<void, Valor>((ref, valor) async {
  var response = await ref.watch(apiProvider).request(
        '/valores/${valor.id}',
        method: HttpMethod.put,
        body: valor.toJson(),
      );

  if (response.error != null) {
    throw response.error!;
  }

  ref.read(categoriasProvider.notifier).update((value) {
    for (var c in value) {
      c.valores = c.valores.map((v) {
        if (v.id == valor.id) {
          return valor;
        }
        return v;
      }).toList();
    }
    return value;
  });
});
