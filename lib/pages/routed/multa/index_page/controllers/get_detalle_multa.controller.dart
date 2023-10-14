import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_logger/simple_logger.dart';

import '../dto/detalle_multa.dto.dart';

final getDetalleMultaProvider = FutureProvider.family<DetalleMultaDto, int>((ref, id) async {
  
  var response = await ref
      .watch(apiProvider)
      .request<DetalleMultaDto>('/multa/$id', parser: detalleMultaFromJson);

  if (response.error != null) {
    var logger = SimpleLogger();
    logger.warning(response.error!.exception);
    throw response.error!;
  }

  return response.data!;

});