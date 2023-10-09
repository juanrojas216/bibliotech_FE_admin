import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/models/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/editorial/repository/editoriales.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updateEditorialProvider =
    FutureProvider.family<void, Editorial>((ref, editorial) async {
  var response = await ref.watch(apiProvider).request<Map<String, dynamic>>(
        '/editoriales/${editorial.id}',
        method: HttpMethod.put,
        body: editorialToJson(editorial),
      );

  if (response.error != null) {
    throw response.error!;
  }

  ref.read(editorialesProvider.notifier).update((value) => value.map((e) {
        if (e.id == editorial.id) return editorial;
        return e;
      }).toList());
});
