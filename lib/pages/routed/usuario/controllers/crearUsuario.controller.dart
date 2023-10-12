
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';

import '../dto/createUsuario.dto.dart';
import 'getAllUsuarios.controller.dart';



final crearUsuarioProvider = FutureProvider.family<void, CreateUsuarioDto>((ref, usuario) async {
  var response = await ref.watch(apiProvider).request(
        '/auth/signup',
        method: HttpMethod.post,
        body: usuario.toMap(),
      );

  if (response.error != null) {
    throw response.error!;
  }

  ref.invalidate(getAllUsuariosProvider);

});
