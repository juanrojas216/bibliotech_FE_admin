import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/models/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/edicion.repository.dart';


final getAllEdicionProvider = FutureProvider.autoDispose<List<Edicion>>((ref) async {
  
  var response = await ref
      .watch(apiProvider)
      .request<List<Edicion>>('/ediciones', parser: edicionesFromJson);

  if (response.error != null) {
    throw response;
  }

  return response.data!;
  // ref.read(edicionesProvider.notifier).update((_) => response.data!);
});
