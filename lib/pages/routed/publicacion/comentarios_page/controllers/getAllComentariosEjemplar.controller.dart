
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bibliotech_admin/models/index.dart';

final getAllComentariosEjemplarProvider = FutureProvider.autoDispose.family<List<Comentario>, int>((ref, id) async {
  var response = await ref.watch(apiProvider).request<List<Comentario>>(
        '/ejemplares/$id/comentarios',
        parser: comentariosFromJson,
  );

  if (response.error != null) {
    throw response;
  }

  return response.data!;
  // ref.read(comentariosProvider.notifier).update((_) => response.data!,);
});