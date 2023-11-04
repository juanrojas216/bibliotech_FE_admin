
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dto/ejemplar_item.dto.dart';


final getAllUbicacionLibreProvider = FutureProvider.autoDispose<List<Ubicacion>>((ref) async {
  
  var response = await ref.watch(apiProvider).request<List<Ubicacion>>(
        '/ubicaciones/disponibles',
        parser: ubicacionesFromJson,
  );

  if (response.error != null) {
    throw response;
  }

  return response.data!;

  // ref.read(ubicacionesProvider.notifier).update((_) => ubicaiones,);

});