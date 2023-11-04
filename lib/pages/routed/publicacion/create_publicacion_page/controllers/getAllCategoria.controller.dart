
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/models/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repository/categorias.repository.dart';

final getAllCategoriasProvider = FutureProvider.autoDispose<List<Categoria>>((ref) async {
  
  var response = await ref.watch(apiProvider).request<List<Categoria>>(
        '/categorias',
        parser: categoriasFromJson,
  );

  if (response.error != null) {
    throw response;
  }

  return response.data!;
  // ref.read(categoriasProvider.notifier).update((_) => response.data!);
});