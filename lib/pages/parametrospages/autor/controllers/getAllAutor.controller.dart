
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/models/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/autor/repository/autores.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getAllAutoresProvider = FutureProvider.autoDispose<void>((ref) async {
  var response = await ref.watch(apiProvider).request<List<Autor>>(
        '/autores',
        parser: autoresFromJson,
  );

  if (response.error != null) {
    print(response.error!.exception);
    throw response;
  }

  ref.read(autoresProvider.notifier).update((_) => response.data!,);
});