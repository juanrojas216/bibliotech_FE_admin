import 'dart:convert';

import 'package:bibliotech_admin/pages/routed/usuario/controllers/getAllUsuarios.controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';

import '../dto/createUsuario.dto.dart';



final crearUsuarioProvider = FutureProvider.family<void, CreateUsuarioDto>((ref, usuario) async {
  var response = await ref.watch(apiProvider).request(
        '/auth/signup',
        method: HttpMethod.post,
        body: json.encode(usuario.toMap()),
      );

  if (response.error != null) {
    throw response.error!;
  }

  ref.invalidate(getAllUsuariosProvider);

});
