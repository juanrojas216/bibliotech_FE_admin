import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/pages/parametrospages/facultad/repository/facultades.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final deletePlataformaProvider = FutureProvider.family<void, int>((ref, id) async {
  
  var response = await ref.watch(apiProvider).request(
        '/plataformas/$id',
        method: HttpMethod.delete,
      );

  if (response.error != null) {
    throw response.error!;
  }

  ref.read(facultadesProvider.notifier).update((value) {
    return value.where((f) => f.id != id).toList();
  });

});