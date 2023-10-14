// import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../dto/usuario_multa.dto.dart';

final searchUsuariosProvider = FutureProvider.autoDispose<List<UsuarioMultaDto>>((ref) async {
  
  await Future.delayed(const Duration(seconds: 2));

  List<UsuarioMultaDto> response = [];

  response = List.generate(
        30,
        (index) => UsuarioMultaDto(
              id: index,
              dni: "dni $index",
              legajo: "legajo $index",
              nombre: "nombre $index",
              apellido: "apellido $index",
            ));

  // var response = await ref.watch(apiProvider).request<List<UsuarioMultaDto>>(
  //       '/autores',
  //       method: HttpMethod.put,
  //       body: dto.toMap(),
  //       parser: usuariosFromJson,
  // );

  // if (response.error != null) {
  //   throw response.error!;
  // }

  return response;
});
