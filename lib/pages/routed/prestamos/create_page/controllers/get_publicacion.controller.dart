// import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/pages/routed/prestamos/create_page/dto/publicacion_prestamo.dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final searchPublicacionProvider = FutureProvider<List<PublicacionPrestamoDto>>((ref) async {
  
  await Future.delayed(const Duration(seconds: 4));

  List<PublicacionPrestamoDto> response = [];

  response = List.generate(
        30,
        (index) => PublicacionPrestamoDto(
              id: index,
              isbn: 'isbn $index',
              anio: 2000 + index,
              titulo: "publicacion $index",
              autores: ["autor $index"],
              edicion: "edicion $index",
              editoriales: ["editorial $index"],
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
