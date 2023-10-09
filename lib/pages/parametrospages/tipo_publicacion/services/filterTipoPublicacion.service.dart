

import 'package:bibliotech_admin/models/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/tipo_publicacion/repository/tiposPublicacion.respository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filtroTiposPublicacionProvider = Provider.family<List<TipoPublicacion>, String>((ref, filtro) {
  var tiposPublicacion = ref.watch(tiposPublicacionProvider);
  tiposPublicacion = tiposPublicacion.where((tp) => tp.nombre.toLowerCase().contains(filtro.toLowerCase())).toList();
  return tiposPublicacion;
});