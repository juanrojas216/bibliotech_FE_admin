import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dto/parametro_multa.dto.dart';


final getParametrosMultasProvider = FutureProvider<List<ParametroMultaDto>>((ref) async {
  
  var response = await ref.watch(apiProvider).request<List<ParametroMultaDto>>(
      '/tipo-multas',
      parser: parametrosMultaFromJson
  );

  if (response.error != null) {
    throw response.error!;
  }

  return response.data!;

  // return List.generate(10, (index) => ParametroMultaDto(
  //   id: index,
  //   nombre: 'Parametro $index',
  //   dias: index*2,

  // ));
});
