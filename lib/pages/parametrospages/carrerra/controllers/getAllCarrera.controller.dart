import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/models/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/carreras.repository.dart';

final getAllCarreraProvider = FutureProvider.autoDispose<void>((ref) async {
  
  var response = await ref
      .watch(apiProvider)
      .request<List<Carrera>>('/carreras', parser: carrerasFromJson);

  if (response.error != null) {
    throw response;
  }

  ref.read(carrerasProvider.notifier).update((state) => response.data!);
});
