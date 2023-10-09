

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dto/tabla_multa.dto.dart';

final multasTablaProvider = StateProvider<List<MultaItemTablaDto>>((ref) {
  return [];
});