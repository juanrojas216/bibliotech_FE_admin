
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dto/detalleUsuario.dto.dart';

final getDetalleUsuarioProvider = FutureProvider.autoDispose.family<DetalleUsuarioDto, int>((ref, id) async {
  
  var response = await ref.watch(apiProvider).request<DetalleUsuarioDto>(
        '/usuarios/$id',
        parser: detalleUsuarioFromJson,
  );

  if (response.error != null) {
    throw response.error!;
  }

  return response.data!;
});

// import 'package:bibliotech_admin/pages/routed/usuario/dto/detalleUsuario.dto.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final detalleUsuarioProvider = StateNotifierProvider.autoDispose<DetalleUsuarioNotifier, DetalleUsuarioDto?>((ref) => DetalleUsuarioNotifier());


// class DetalleUsuarioNotifier extends StateNotifier<DetalleUsuarioDto?> {
  
//  DetalleUsuarioNotifier(): super(null);


// }

