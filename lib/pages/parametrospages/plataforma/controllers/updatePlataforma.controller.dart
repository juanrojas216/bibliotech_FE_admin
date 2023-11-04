import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/models/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/plataforma/repository/plataformas.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updatePlataformaProvider =
    FutureProvider.family<void, Plataforma>((ref, plataforma) async {
  var response = await ref.watch(apiProvider).request(
        '/plataformas/${plataforma.id}',
        method: HttpMethod.put,
        body: plataformaToJson(plataforma),
      );

  if (response.error != null) {
    throw response;
  }

  ref.read(plataformasProvider.notifier).update((value) => value.map((p) {
        if (p.id == plataforma.id) return plataforma;
        return p;
      }).toList());
});
