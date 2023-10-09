

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dto/publicacion.dto.dart';

final publicacionesProvider = StateProvider<List<PublicacionDto>>((ref) {
  return [];
});