import 'package:bibliotech_admin/new_models/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tipoPublicacionProvider = StateProvider<List<TipoPublicacion>>((ref) {
  return [];
});