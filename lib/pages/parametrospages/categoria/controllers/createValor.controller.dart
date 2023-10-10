

import 'dart:math';

import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bibliotech_admin/models/index.dart';
import 'package:simple_logger/simple_logger.dart';

import '../repository/categorias.repository.dart';
import '../dto/valor.dto.dart';


final createValorProvider = FutureProvider.family<void, ValorDto>((ref, valorDto) async {
  
  var response = await ref.watch(apiProvider).request(
    '/categoria-valores',
    method: HttpMethod.post,
    body: valorDto.toMap(),
    parser: valorFromJson,
  );

  if (response.error != null) {
    var logger = SimpleLogger();
    logger.warning(response.error!.exception);
    logger.warning(response.error!.data);
    throw response.error!;
  } else {
    var logger = SimpleLogger();
    logger.info(response.data!.toJson());
  }
  ref.read(categoriasProvider.notifier).update((state) {
    for (var c in state) { 
      if(c.id == valorDto.idCategoria){
        c.valores = [...c.valores, response.data!];
      }
      continue;
    }
    return [...state];
  });
});