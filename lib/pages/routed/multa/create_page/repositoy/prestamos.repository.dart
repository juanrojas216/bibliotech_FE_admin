

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dto/usuario_prestamo.dto.dart';

final prestamosMultasProvider = StateProvider<List<PrestamoMultaDto>>((ref) {
  return [];
});