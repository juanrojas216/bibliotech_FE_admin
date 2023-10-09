

import 'package:bibliotech_admin/models/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/edicion/repository/ediciones.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filtroEdicionesProvider = Provider.family<List<Edicion>, String>((ref, filtro) {
  var ediciones = ref.watch(edicionesProvider);
  ediciones = ediciones.where((e) => e.nombre.toLowerCase().contains(filtro.toLowerCase())).toList();
  return ediciones;
});