import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/models/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/edicion/repository/ediciones.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getAllEdicionProvider = FutureProvider<void>((ref) async {
  
  var response = await ref
      .watch(apiProvider)
      .request<List<Edicion>>('/ediciones', parser: edicionesFromJson);

  if (response.error != null) {
    throw response.error!;
  }

  ref.read(edicionesProvider.notifier).update((state) => response.data!);
});
