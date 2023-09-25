

import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/new_models/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dto/autor.dto.dart';
import '../repository/autores.repository.dart';

final createAutorProvider = FutureProvider.family<void, AutorDto>((ref, autorDto) async {
  
  var response = await ref.watch(apiProvider).request(
    '/autores',
    method: HttpMethod.post,
    body: autorDto.toMap(),
    parser: autorFromJson,
  );

  if (response.error != null) {
    throw response.error!;
  }

  ref.read(autoresProvider.notifier).update((state) {
    state = [ ...state, response.data!];
    return state;
  });
});