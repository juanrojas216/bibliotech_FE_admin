

import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dto/create_parametro_multa.dto.dart';
import 'get_parametros_multa.controller.dart';


final createParametroMultaProvider = FutureProvider.family<void, CreateParametroMultaDto>((ref, dto) async {
  
  var response = await ref.watch(apiProvider).request(
    '/tipo-multas',
    method: HttpMethod.post,
    body: dto.toJson(),
  );

  if (response.error != null) {
    throw response.error!;
  }

  ref.invalidate(getParametrosMultasProvider);
});