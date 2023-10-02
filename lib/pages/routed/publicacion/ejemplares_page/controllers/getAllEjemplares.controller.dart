import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/new_models/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/ejemplares.repository.dart';

final getAllEjemplaresProvider = FutureProvider.family<void, int>((ref, id) async {
  
  var response = await ref.watch(apiProvider).request<List<Ejemplar>>(
        '/ejemplares_publicacion/$id',
        parser: ejemplaresFromJson,
  );

  if (response.error != null) {
    throw response.error!;
  }

  ref.read(ejemplaresProvider.notifier).update((_) => response.data!);
});