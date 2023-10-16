// import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dto/ejemplar_prestamo.dto copy.dart';


final searchEjemplaresProvider = FutureProvider.family<Map, int>((ref, id) async {
  
  await Future.delayed(const Duration(seconds: 4));

  List<EjemplarPrestamoDto> response = [];

  response = List.generate(
        30,
        (index) => EjemplarPrestamoDto(
              id: index,
              valoracion: '$index/10',
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

  var respuesta = {
    "ejemplares": response,
    "diasMaximo": 10 
  };

  return respuesta;
});
