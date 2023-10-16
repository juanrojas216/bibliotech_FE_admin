import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dto/roles_usuario.dto.dart';

final getPrivilegiosEntidadProvider = FutureProvider<Map>((ref) async {
  // var privilegios = await ref.watch(apiProvider).request<List<Privilegio>>(
  //       '/privilegios',
  //       parser: privilegiosRolesUsuarioDtoFromJson,
  //     );

  // if (privilegios.error != null) {
  //   throw privilegios.error!;
  // }

  // var entidades = await ref.watch(apiProvider).request<List<Entidad>>(
  //       '/entidades',
  //       parser: entidadesRolesUsuarioDtoFromJson,
  //     );

  // if (entidades.error != null) {
  //   throw entidades.error!;
  // }

  // var response = {
  //   "privilegios": privilegios,
  //   "entidades": entidades,
  // };

  var response = {
    "privilegios": List.generate(10, (i) => Privilegio(idPrivilegio: i, nombre: "nombre $i", activo: true)),
    "entidades": List.generate(6, (index) => Entidad(idEntidad: index, nombreEntidad: "nombreEntidad $index")),
  };

  return response;
});
