import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/pages/parametrospages/edicion/repository/ediciones.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final deleteEdicionProvider = FutureProvider.family<void, int>((ref, id) async {
  
  var response = await ref.watch(apiProvider).request(
        '/ediciones/$id',
        method: HttpMethod.delete,
      );

  if (response.error != null) {
    throw response;
  }

  ref.read(edicionesProvider.notifier).update((value) {
    return value.where((e) => e.id != id).toList();
  });

});