
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../dto/listaUsuario.dto.dart';

final getAllUsuariosProvider = FutureProvider.autoDispose<List<ListaUsuarioDto>>((ref) async {
  
  var response = await ref.watch(apiProvider).request<List<ListaUsuarioDto>>(
        '/users',
        parser: usuariosFromJson,
  );

  if (response.error != null) {
    throw response.error!;
  }

  return response.data!;
});