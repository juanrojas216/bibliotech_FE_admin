// import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/api/http_admin.dart';


final getCantidadDiasPrestamo = FutureProvider<String>((ref) async {

  var response = await ref.watch(apiProvider).request<String>(
        '/parametros/cantidadDiasPrestamo',
        parser: (data) {
          Map<String, dynamic> map = data;
          return map["valor"];
        },
  );

  if (response.error != null) {
    throw response;
  }

  return response.data!;
});
