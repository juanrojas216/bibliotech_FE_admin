// import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_logger/simple_logger.dart';

import '../../../../../config/api/http_admin.dart';
import '../dto/ejemplar_prestamo.dto copy.dart';


final searchEjemplaresProvider = FutureProvider.family<Map, int>((ref, id) async {

  var response = await ref.watch(apiProvider).request<List<EjemplarPrestamoDto>>(
        '/ejemplares/publicaciones/$id',
        parser: ejemplaresPrestamoFromJson,
  );

  if (response.error != null) {
    var logger = SimpleLogger();
    logger.warning(response.error!.exception);
    logger.warning(response.error!.data);
    throw response;
  }

  var respuesta = {
    "ejemplares": response.data!,
    "diasMaximo": 10 
  };

  return respuesta;
});
