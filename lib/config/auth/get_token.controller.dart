// import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_logger/simple_logger.dart';

import 'auth.service.dart';
import 'inicio_sesion.dto.dart';
import 'token_admin.dart';


final getTokenProvider = FutureProvider.autoDispose.family<void, InicioSesionDto>((ref, dto) async {
  
  var response = await ref.read(apiProvider).request(
    '/auth/signin',
    method: HttpMethod.signing,
    body: dto.toMap(),
  );
  
  var logger = SimpleLogger();
  logger.info(response.data);

  if (response.error != null) {
    throw Error();
  }

  await storage.write(
    key: 'token',
    value: response.data!['token'],
  );

  Auth.isActive = true;
  
});