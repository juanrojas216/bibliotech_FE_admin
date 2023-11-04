import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dto/roles_usuario.dto.dart';

final getRolesUsuarioProvider = FutureProvider<Map>((ref) async {
  // var roles = await ref.watch(apiProvider).request<List<RolUsuarioDto>>(
  //       '/roles',
  //       parser: rolesUsuarioDtoFromJson,
  //     );

  // if (response.error != null) {
  //   throw response;
  // }

  // var entidades = await ref.watch(apiProvider).request<List<Entidad>>(
  //       '/entidades',
  //       parser: entidadesRolesUsuarioDtoFromJson,
  //     );

  // if (entidades.error != null) {
  //   throw entidades.error!;
  // }

  // var response = {
  //   "roles": roles,
  //   "entidades": entidades,
  // };

  var response = {
    "roles": List.generate(
      5,
      (index) => RolUsuarioDto(
        idRol: index,
        nombreRol: "nombreRol $index",
        entidad: Entidad(idEntidad: 0, nombreEntidad: "nombreEntidad 0"),
        privilegios: List.generate(
          4,
          (i) => Privilegio(idPrivilegio: i, nombre: "nombre $i", activo: true),
        ),
      ),
    ),
    "entidades": List.generate(6, (index) => Entidad(idEntidad: index, nombreEntidad: "nombreEntidad $index")),
  };

  return response;
});
