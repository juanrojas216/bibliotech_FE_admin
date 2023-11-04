
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/models/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/ubicacion/repository/ubicaciones.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dto/ubicacion.dto.dart';


final createUbicacionProvider = FutureProvider.family<void, UbicacionDto>((ref, ubicacionDto) async {
  
  var response = await ref.watch(apiProvider).request(
    '/ubicaciones',
    method: HttpMethod.post,
    body: ubicacionDto.toMap(),
    parser: ubicacionFromJson,
  );

  if (response.error != null) {
    throw response;
  }

  ref.read(ubicacionesProvider.notifier).update((state) {
    state = [ ...state, response.data!];
    return state;
  });
});