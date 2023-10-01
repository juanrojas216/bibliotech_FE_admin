

import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/new_models/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/plataforma/dto/create_plataforma.dto.dart';
import 'package:bibliotech_admin/pages/parametrospages/plataforma/repository/plataformas.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final createPlataformaProvider = FutureProvider.family<void, CreatePlataformaDto>((ref, plataforma) async {
  
  var response = await ref.watch(apiProvider).request(
    '/plataformas',
    method: HttpMethod.post,
    body: plataforma.toMap(),
    parser: plataformaFromJson,
  );

  if (response.error != null) {
    throw response.error!;
  }

  ref.read(plataformasProvider.notifier).update((state) {
    state = [ ...state, response.data!];
    return state;
  });
});