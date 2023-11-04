import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_logger/simple_logger.dart';

import '../dto/ejemplar_item.dto.dart';


final getAllEjemplaresProvider = FutureProvider.family.autoDispose<List<EjemplarItemDto>, int>((ref, id) async {
  
  // var response = await ref.watch(apiProvider).request<List<Ejemplar>>(
  //       '/ejemplares/publicaciones/$id',
  //       parser: ejemplaresFromJson,
  // );

  var response = await ref.watch(apiProvider).request<List<EjemplarItemDto>>(
        '/ejemplares/publicaciones/$id',
        parser: ejemplaresItemFromJson,
  );

  if (response.error != null) {
    var logger = SimpleLogger();
    logger.warning(response.error!.data);
    throw response;
  }

  return response.data!;

  // ref.read(ejemplaresProvider.notifier).update((_) => response.data!);
});