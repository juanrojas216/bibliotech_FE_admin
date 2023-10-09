

import 'package:bibliotech_admin/models/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/plataforma/repository/plataformas.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filtroPlataformasProvider = Provider.family<List<Plataforma>, String>((ref, filtro) {
  var paltaformas = ref.watch(plataformasProvider);
  paltaformas = paltaformas.where((p) => p.nombre.toLowerCase().contains(filtro.toLowerCase())).toList();
  return paltaformas;
});