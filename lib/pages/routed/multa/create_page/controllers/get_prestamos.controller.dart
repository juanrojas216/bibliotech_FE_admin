// import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/pages/routed/multa/create_page/dto/usuario_prestamo.dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dto/search_prestamo.dart';
import '../repositoy/prestamos.repository.dart';

final searchPrestamosProvider = FutureProvider.family<void, SearchPrestamoDto?>((ref, dto) async {
  
  await Future.delayed(const Duration(seconds: 4));

  List<PrestamoMultaDto> response = [];

  if (dto != null) {
    response = List.generate(
        30,
        (index) => PrestamoMultaDto(
              id: index,
              publicacion: "publicacion $index",
              ejemplar: "ejemplar $index",
              fechaInicio: "fechaInicio $index",
              estado: "estado $index",
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

  ref.read(prestamosMultasProvider.notifier).update(
        (_) => response,
      );
});
