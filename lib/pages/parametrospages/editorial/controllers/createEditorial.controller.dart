import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/new_models/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/editorial/repository/editoriales.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final createEditorialProvider = FutureProvider.family<void, String>((ref, nombre) async {
  var response = await ref.watch(apiProvider).request<dynamic>(
        '/editoriales',
        method: HttpMethod.post,
        body: {"nombre": nombre},
        parser: editorialFromJson,
      );

  if (response.error != null) {
    throw response.error!;
  }

  ref.read(editorialesProvider.notifier).update((state) {
    state = [ ...state, response.data!];
    return state;
  });
});