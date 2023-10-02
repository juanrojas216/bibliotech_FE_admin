import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/new_models/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dto/create_ejemplar.dto.dart';
import '../repository/ejemplares.repository.dart';

final createEjemplarProvider = FutureProvider.family<void, EjemplarDto>((ref, dto) async {
  
  var response = await ref.watch(apiProvider).request<Ejemplar>(
        '/ejemplares_publicacion',
        method: HttpMethod.post,
        body: dto.toMap(),
        parser: ejemplarFromJson,
  );

  if (response.error != null) {
    throw response.error!;
  }

  ref.read(ejemplaresProvider.notifier).update((state) => [...state, response.data!]);
});