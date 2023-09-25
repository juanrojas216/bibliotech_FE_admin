import 'package:bibliotech_admin/new_models/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/ubicacion/repository/ubicaciones.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filtroListaUbicacionesProvider = Provider.family<List<Ubicacion>, String>((ref, filtro) {
  var ubicaciones = ref.watch(ubicacionesProvider);
  ubicaciones = ubicaciones
      .where(
        (a) => a.descripcion
        .toLowerCase()
        .contains(filtro.toLowerCase()),)
      .toList();
  return ubicaciones;
});
