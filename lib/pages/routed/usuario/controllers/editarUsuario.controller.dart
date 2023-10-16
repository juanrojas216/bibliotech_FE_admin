import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';

import '../dto/detalle_usuario.dto.dart';
import 'getAllUsuarios.controller.dart';



final updateUsuarioProvider = FutureProvider.family<void, DetalleUsuarioDto>((ref, usuario) async {
  var response = await ref.watch(apiProvider).request(
        '/users/${usuario.id}',
        method: HttpMethod.put,
        body: json.encode(usuario.toMap()),
      );

  if (response.error != null) {
    throw response.error!;
  }

  ref.invalidate(getAllUsuariosProvider);

});
