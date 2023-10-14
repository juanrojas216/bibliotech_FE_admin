import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_logger/simple_logger.dart';

final finalizarMultaProvider = FutureProvider.family<void, int>((ref, id) async {
  
  var response = await ref.watch(apiProvider).request<void>(
        '/multa/$id',
        method:HttpMethod.delete ,
      );

  if (response.error != null) {
    var logger = SimpleLogger();
    logger.warning(response.error!.exception);
    throw response.error!;
  }

});
