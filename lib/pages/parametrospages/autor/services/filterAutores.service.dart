import 'package:bibliotech_admin/new_models/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/autor/repository/autores.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filtroListaAutoresProvider = Provider.family<List<Autor>, String>((ref, filtro) {
  var autores = ref.watch(autoresProvider);
  autores = autores
      .where(
        (a) => a.nombre
        .toLowerCase()
        .contains(filtro.toLowerCase()),)
      .toList();
  return autores;
});
