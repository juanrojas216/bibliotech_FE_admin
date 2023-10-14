import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/pages/routed/multa/index_page/dto/parametro_multa.dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'get_parametros_multa.controller.dart';

final updateParametroMultaProvider = FutureProvider.family<void, ParametroMultaDto>((ref, parametro) async {
  var response = await ref.watch(apiProvider).request(
        '/tipo-multas/${parametro.id}',
        method: HttpMethod.put,
        body: parametroMultaToJson(parametro),
      );

  if (response.error != null) {
    throw response.error!;
  }

  ref.invalidate(getParametrosMultasProvider);
});
