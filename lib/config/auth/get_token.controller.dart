// import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'inicio_sesion.dto.dart';
import 'token_admin.dart';


final getTokenProvider = FutureProvider.family<void, InicioSesionDto>((ref, dto) async {
  
  var response = await Http(baseUrl: 'http://localhost:8080/api/v1').request(
    '/auth/signin',
    method: HttpMethod.signing,
    body: dto.toMap(),
  );

  if (response.error != null) {
    throw Error();
  }

  await storage.write(
    key: 'token',
    value: response.data!['token'],
  );
  
});