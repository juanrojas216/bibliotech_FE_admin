

import 'package:bibliotech_admin/models/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/facultad/repository/facultades.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filtroFacultadesProvider = Provider.family<List<Facultad>, String>((ref, filtro) {
  var facultades = ref.watch(facultadesProvider);
  facultades = facultades.where((f) => f.nombre.toLowerCase().contains(filtro.toLowerCase())).toList();
  return facultades;
});