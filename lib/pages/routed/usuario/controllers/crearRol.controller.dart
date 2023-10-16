
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';

import '../dto/create_usuario.dto.dart';
import '../dto/roles_usuario.dto.dart';
import 'getAllUsuarios.controller.dart';
import 'getRoles.controller.dart';



final crearRolProvider = FutureProvider.family<void, CreateRol>((ref, rol) async {
  
  var response = await ref.watch(apiProvider).request(
        '/roles',
        method: HttpMethod.post,
        body: rol.toJson(),
      );

  if (response.error != null) {
    throw response.error!;
  }

  ref.invalidate(getRolesUsuarioProvider);

});
