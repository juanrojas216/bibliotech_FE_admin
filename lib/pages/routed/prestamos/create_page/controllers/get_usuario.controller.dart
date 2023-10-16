// import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../dto/usuario_prestamo.dto.dart';

final searchUsuariosProvider = FutureProvider.autoDispose<List<UsuarioPrestamoDto>>((ref) async {
  
  await Future.delayed(const Duration(seconds: 2));

  List<UsuarioPrestamoDto> response = [];

  response = List.generate(
        30,
        (index) => UsuarioPrestamoDto(
              id: index,
              dni: "dni $index",
              legajo: "legajo $index",
              nombre: "nombre $index",
              apellido: "apellido $index",
            ));

  // var response = await ref.watch(apiProvider).request<List<UsuarioPrestamoDto>>(
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
