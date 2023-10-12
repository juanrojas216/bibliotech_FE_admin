import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dto/detalleUsuario.dto.dart';

final getDetalleUsuarioProvider = FutureProvider.autoDispose.family<DetalleUsuarioDto, int>((ref, id) async {

// var response = await ref.watch(apiProvider).request<DetalleUsuarioDto>(
//       '/usuarios/$id',
//       parser: detalleUsuarioFromJson,
// );

// if (response.error != null) {
//   throw response.error!;
// }

//   return response.data!;

  return DetalleUsuarioDto(id: 1, nombre: "nombre", apellido: "apellido", email: "email", password: "password", roles: [1]);
});

// import 'package:bibliotech_admin/config/router/admin_router.dart';
// import 'package:bibliotech_admin/pages/routed/usuario/dto/detalleUsuario.dto.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../../config/api/http_admin.dart';

// final detalleUsuarioProvider = StateNotifierProvider.autoDispose<
//     DetalleUsuarioNotifier,
//     DetalleUsuarioDto?>((ref) => DetalleUsuarioNotifier(ref));

// class DetalleUsuarioNotifier extends StateNotifier<DetalleUsuarioDto?> {
  
//   final AutoDisposeStateNotifierProviderRef<DetalleUsuarioNotifier, DetalleUsuarioDto?> ref;

//   DetalleUsuarioNotifier(this.ref) : super(null);

//   getDetalle(int id) async {
    
//     var response = await ref.watch(apiProvider).request<DetalleUsuarioDto>(
//           '/usuarios/$id',
//           parser: detalleUsuarioFromJson,
//         );

//     if (response.error != null) {
//       throw response.error!;
//     }

//     state = response.data!;
//   }
// }
