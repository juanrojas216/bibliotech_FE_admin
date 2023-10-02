import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/new_models/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/ejemplares.repository.dart';

final updateEjemplarProvider = FutureProvider.family<void, Ejemplar>((ref, ejemplar) async {
  var response = await ref.watch(apiProvider).request(
        '/ejemplares_publicacion/${ejemplar.id}',
        method: HttpMethod.put,
        body: ejemplarToJson(ejemplar),
      );

  if (response.error != null) {
    throw response.error!;
  }

  ref.read(ejemplaresProvider.notifier).update((value) => value.map((e) {
        if (e.id == ejemplar.id) return ejemplar;
        return e;
      }).toList());
});
