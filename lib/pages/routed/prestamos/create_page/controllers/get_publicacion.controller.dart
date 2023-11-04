// import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/pages/routed/prestamos/create_page/dto/publicacion_prestamo.dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/api/http_admin.dart';


final searchPublicacionProvider = FutureProvider<List<PublicacionPrestamoDto>>((ref) async {

  var response = await ref.watch(apiProvider).request<List<PublicacionPrestamoDto>>(
        '/publicaciones',
        parser: publicacionesPrestamoFromJson,
  );

  if (response.error != null) {
    throw response;
  }

  return response.data!;
});
