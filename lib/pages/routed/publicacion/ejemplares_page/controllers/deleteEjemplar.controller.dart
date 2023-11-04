import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'getAllEjemplares.controller.dart';

final deleteEjemplarProvider = FutureProvider.family<void, int>((ref, id) async {
  
  var response = await ref.watch(apiProvider).request(
        '/ejemplares/$id',
        method: HttpMethod.delete,
  );

  if (response.error != null) {
    throw response;
  }

  ref.invalidate(getAllEjemplaresProvider);

  // ref.read(ejemplaresProvider.notifier).update((value) {
  //   return value.where((e) => e.id != id).toList();
  // });

});