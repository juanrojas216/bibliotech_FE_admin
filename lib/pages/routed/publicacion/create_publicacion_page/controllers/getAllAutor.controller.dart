
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/models/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/autores.repository.dart';

final getAllAutoresProvider = FutureProvider.autoDispose<List<Autor>>((ref) async {
  
  var response = await ref.watch(apiProvider).request<List<Autor>>(
        '/autores',
        parser: autoresFromJson,
  );

  if (response.error != null) {
    throw response;
  }

  return response.data!;

  // ref.read(autoresProvider.notifier).update((_) => response.data!);
});