// import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../dto/usuario_prestamo.dto.dart';

final searchUsuariosProvider = FutureProvider.autoDispose<List<UsuarioPrestamoDto>>((ref) async {
  
  var response = await ref.watch(apiProvider).request<List<UsuarioPrestamoDto>>(
        '/users/getUsers',
        parser: usuariosFromJson,
  );

  if (response.error != null) {
    throw response;
  }

  return response.data!;
});
