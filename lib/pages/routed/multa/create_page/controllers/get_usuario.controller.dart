// import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dto/search_usuario.dart';
import '../dto/usuario_multa.dto.dart';
import '../repositoy/usuarios.repository.dart';

final searchUsuariosProvider = FutureProvider.family<void, SearchUsuarioDto?>((ref, dto) async {
  
  await Future.delayed(const Duration(seconds: 4));

  List<UsuarioMultaDto> response = [];

  if (dto != null) {
    response = List.generate(
        30,
        (index) => UsuarioMultaDto(
              id: index,
              dni: "dni $index",
              legajo: "legajo $index",
              nombre: "nombre $index",
              apellido: "apellido $index",
            ));
  }

  // var response = await ref.watch(apiProvider).request<List<UsuarioMultaDto>>(
  //       '/autores',
  //       method: HttpMethod.put,
  //       body: dto.toMap(),
  //       parser: usuariosFromJson,
  // );

  // if (response.error != null) {
  //   throw response.error!;
  // }

  ref.read(usuariosMultasProvider.notifier).update(
        (_) => response,
      );
});
