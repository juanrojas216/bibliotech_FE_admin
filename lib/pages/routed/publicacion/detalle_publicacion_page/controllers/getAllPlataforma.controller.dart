
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/models/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/plataformas.repository.dart';

final getAllPlataformasProvider = FutureProvider<void>((ref) async {
  
  var response = await ref.watch(apiProvider).request<List<Plataforma>>(
        '/plataformas',
        parser: plataformasFromJson,
  );

  if (response.error != null) {
    throw response.error!;
  }

  ref.read(plataformasProvider.notifier).update((_) => response.data!);
});