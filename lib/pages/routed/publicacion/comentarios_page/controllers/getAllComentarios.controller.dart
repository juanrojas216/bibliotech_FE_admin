
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/models/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getAllComentariosProvider = FutureProvider.autoDispose.family<List<Comentario>, int>((ref, id) async {
  var response = await ref.watch(apiProvider).request<List<Comentario>>(
        '/comentarios/$id',
        parser: comentariosFromJson,
  );

  if (response.error != null) {
    throw response.error!;
  }

  return response.data!;
  // ref.read(comentariosProvider.notifier).update((_) => response.data!,);
});