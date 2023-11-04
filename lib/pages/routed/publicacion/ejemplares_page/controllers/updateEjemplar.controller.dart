import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dto/ejemplar_item.dto.dart';
import 'getAllEjemplares.controller.dart';


final updateEjemplarProvider = FutureProvider.family<void, EjemplarItemDto>((ref, ejemplar) async {
  var response = await ref.watch(apiProvider).request(
        '/ejemplares/${ejemplar.id}',
        method: HttpMethod.put,
        body: ejemplarItemToJson(ejemplar),
      );

  if (response.error != null) {
    throw response;
  }

  ref.invalidate(getAllEjemplaresProvider);

  // ref.read(ejemplaresProvider.notifier).update((value) => value.map((e) {
  //       if (e.id == ejemplar.id) return ejemplar;
  //       return e;
  //     }).toList());
});
