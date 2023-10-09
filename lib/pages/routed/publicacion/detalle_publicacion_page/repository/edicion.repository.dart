import 'package:bibliotech_admin/models/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final edicionesProvider = StateProvider<List<Edicion>>((ref) {
  return [];
});