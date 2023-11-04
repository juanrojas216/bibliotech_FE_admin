import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_logger/simple_logger.dart';

import '../dto/create_publicacion.dto.dart';
import '../dto/publicacion.dto.dart';

final createPublicacionProvider = FutureProvider.family<void, PublicacionDto>((ref, publicacion) async {
  
  var publicacionDto = createDtoPublicaion(publicacion);
  var logger = SimpleLogger();
  // logger.info(publicacion.toMap());

  
  var response = await ref.watch(apiProvider).request(
        '/publicaciones',
        method: HttpMethod.post,
        body: publicacionDto.toMap(),
      );

  if (response.error != null) {
    logger.warning(response.error!.exception);
    logger.warning(response.error!.data);
    throw response;
  }

});
