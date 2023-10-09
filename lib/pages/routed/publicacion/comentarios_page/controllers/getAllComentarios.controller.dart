
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/models/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../respository/comentarios.repository.dart';

final getAllComentariosProvider = FutureProvider.family<void, int>((ref, id) async {
  var response = await ref.watch(apiProvider).request<List<Comentario>>(
        '/comentarios/$id',
        parser: comentariosFromJson,
  );

  if (response.error != null) {
    throw response.error!;
  }

  ref.read(comentariosProvider.notifier).update((_) => response.data!,);
});