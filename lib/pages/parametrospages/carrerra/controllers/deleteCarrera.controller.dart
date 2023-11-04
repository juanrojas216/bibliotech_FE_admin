import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/carreras.repository.dart';


final deleteCarreraProvider = FutureProvider.family<void, int>((ref, id) async {
  
  var response = await ref.watch(apiProvider).request(
        '/carreras/$id',
        method: HttpMethod.delete,
      );

  if (response.error != null) {
    throw response;
  }

  ref.read(carrerasProvider.notifier).update((value) {
    return value.where((e) => e.id != id).toList();
  });

});