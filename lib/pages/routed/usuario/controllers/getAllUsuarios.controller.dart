
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../dto/listaUsuario.dto.dart';

final getAllUsuariosProvider = FutureProvider.autoDispose<List<ListaUsuarioDto>>((ref) async {
  
  // var response = await ref.watch(apiProvider).request<List<ListaUsuarioDto>>(
  //       '/usuarios',
  //       parser: usuariosFromJson,
  // );

  // if (response.error != null) {
  //   throw response.error!;
  // }

  var response = List.generate(30, (index) => ListaUsuarioDto(id: index, nombre: 'Nombre $index', roles: ['USER']));
  return response;

  // ref.read(usuariosProvider.notifier).update((_) => response);
  // ref.read(usuariosProvider.notifier).update((_) => response.data!);
});