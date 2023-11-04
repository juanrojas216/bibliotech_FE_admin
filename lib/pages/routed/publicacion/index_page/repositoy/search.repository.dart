
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dto/search_publicacion.dto.dart';


final searchPublicacionRepositoryProvider = StateProvider.autoDispose<SearchPublicacionDto?>((ref) {
  return null;
});