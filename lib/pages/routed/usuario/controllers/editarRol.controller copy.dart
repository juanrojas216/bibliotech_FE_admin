import 'dart:convert';

import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dto/roles_usuario.dto.dart';
import 'getRoles.controller.dart';



final updateRolProvider = FutureProvider.family<void, RolUsuarioDto>((ref, rol) async {
  var response = await ref.watch(apiProvider).request(
        '/roles/${rol.idRol}',
        method: HttpMethod.put,
        body: json.encode(rol.toJson()),
      );

  if (response.error != null) {
    throw response.error!;
  }

  ref.invalidate(getRolesUsuarioProvider);

});
