
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/new_models/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/autor/repository/autores.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getAllAutoresProvider = FutureProvider<void>((ref) async {
  var response = await ref.watch(apiProvider).request<List<Autor>>(
        '/autores',
        parser: autoresFromJson,
  );

  if (response.error != null) {
    throw response.error!;
  }

  ref.read(autoresProvider.notifier).update((_) => response.data!,);
});