import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/models/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/editorial.repository.dart';

final getAllEditorialProvider = FutureProvider.autoDispose<void>((ref) async {
  
  var response = await ref
      .watch(apiProvider)
      .request<List<Editorial>>('/editoriales', parser: editorialesFromJson);

  if (response.error != null) {
    throw response.error!;
  }

  ref.read(editorialesProvider.notifier).update((_) => response.data!);
});
