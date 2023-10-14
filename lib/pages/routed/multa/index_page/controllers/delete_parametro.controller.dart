import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'get_parametros_multa.controller.dart';

final deleteParametroMultaProvider = FutureProvider.family<void, int>((ref, id) async {
  var response = await ref.watch(apiProvider).request(
        '/tipo-multas/$id',
        method: HttpMethod.delete,
      );

  if (response.error != null) {
    throw response.error!;
  }

  ref.invalidate(getParametrosMultasProvider);
});
