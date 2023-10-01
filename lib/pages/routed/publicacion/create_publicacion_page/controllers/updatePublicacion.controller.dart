import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dto/create_publicacion.dto.dart';

final createPublicacionProvider = FutureProvider.family<void, PublicacionDto>((ref, publicacion) async {
  var response = await ref.watch(apiProvider).request(
        '/publicaciones',
        method: HttpMethod.post,
        body: publicacion.toMap(),
      );

  if (response.error != null) {
    throw response.error!;
  }

});
