import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';

import '../dto/editar-publicacion.dto.dart';


final updatePublicacionProvider = FutureProvider.family<void, EditarPublicacionDto>((ref, publicacion) async {
  var response = await ref.watch(apiProvider).request(
        '/publicaciones/${publicacion.idPublicacion}',
        method: HttpMethod.put,
        body: json.encode(publicacion.toMap()),
      );

  if (response.error != null) {
    throw response.error!;
  }

});
