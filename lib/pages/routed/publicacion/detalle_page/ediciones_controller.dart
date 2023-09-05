
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/models/ediciones.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final edicionesProvider = FutureProvider<List<Edicion>>((ref) async {
  await Future.delayed(const Duration(seconds: 5));

  var response = await ref
      .watch(apiProvider)
      .request<List<Edicion>>('/ediciones.json', parser: edicionFromJson);

  if (response.error != null) {
    throw response.error!;
  }

  return response.data!;
});