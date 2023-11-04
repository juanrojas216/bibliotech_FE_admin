

import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/models/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/carrerra/repository/carreras.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final createCarreraProvider = FutureProvider.family<void, String>((ref, titulo) async {
  
  var response = await ref.watch(apiProvider).request(
    '/carreras',
    method: HttpMethod.post,
    body: {"nombre": titulo},
    parser: carreraFromJson,
  );

  if (response.error != null) {
    throw response;
  }

  ref.read(carrerasProvider.notifier).update((state) {
    state = [ ...state, response.data!];
    return state;
  });
});