
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dto/lista_usuario.dto.dart';
import 'getAllUsuarios.controller.dart';

final deleteUsuariosProvider = FutureProvider.family<void, int>((ref, id) async {
  
  var response = await ref.watch(apiProvider).request<List<ListaUsuarioDto>>(
        '/usuarios/$id',
        method: HttpMethod.delete,
  );

  if (response.error != null) {
    throw response.error!;
  }

  ref.invalidate(getAllUsuariosProvider);
});