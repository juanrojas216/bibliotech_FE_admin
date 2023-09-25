import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/new_models/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/facultad/repository/facultades.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getAllFacultadProvider = FutureProvider<void>((ref) async {
  
  var response = await ref
      .watch(apiProvider)
      .request<List<Facultad>>('/facultades', parser: facultadesFromJson);

  if (response.error != null) {
    throw response.error!;
  }

  ref.read(facultadesProvider.notifier).update((state) => response.data!);
});
