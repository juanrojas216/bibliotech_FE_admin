import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/models/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dto/cambiar_estado.dto.dart';
import 'getAllEjemplares.controller.dart';

final cambiarEstadoEjemplarProvider = FutureProvider.family<void, CambiarEstadoDto>((ref, dto) async {
  
  var response = await ref.watch(apiProvider).request<Ejemplar>(
        '/ejemplares/${dto.idEjemplar}',
        method: HttpMethod.put,
        body: dto.toMap(),
        parser: ejemplarFromJson,
  );

  if (response.error != null) {
    throw response;
  }

    ref.invalidate(getAllEjemplaresProvider);


  // ref.read(ejemplaresProvider.notifier).update((value) => value.map((e) {
  //       if (e.id == dto.idEjemplar) return response.data!;
  //       return e;
  //     }).toList());
});