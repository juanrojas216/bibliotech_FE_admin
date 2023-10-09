

import 'package:bibliotech_admin/models/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/carrerra/repository/carreras.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filtroCarrerasProvider = Provider.family<List<Carrera>, String>((ref, filtro) {
  var carreras = ref.watch(carrerasProvider);
  carreras = carreras.where((c) => c.nombre.toLowerCase().contains(filtro.toLowerCase())).toList();
  return carreras;
});