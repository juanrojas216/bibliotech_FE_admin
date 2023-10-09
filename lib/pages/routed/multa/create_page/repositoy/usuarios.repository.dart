

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dto/usuario_multa.dto.dart';

final usuariosMultasProvider = StateProvider<List<UsuarioMultaDto>>((ref) {
  return [];
});