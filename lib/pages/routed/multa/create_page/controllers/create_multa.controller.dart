

import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../index_page/controllers/get_multas.controller.dart';
import '../dto/create_multa.dto.dart';


final createMultaProvider = FutureProvider.family<void, CreateMultaDto>((ref, multaDto) async {
  
  
  var response = await ref.watch(apiProvider).request(
    '/multa',
    method: HttpMethod.post,
    body: multaDto.toMap(),
  );

  if (response.error != null) {
    throw response;
  }

  ref.invalidate(searchMultasProvider);
});