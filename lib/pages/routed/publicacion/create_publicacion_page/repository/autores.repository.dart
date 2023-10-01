import 'package:bibliotech_admin/new_models/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final autoresProvider = StateProvider<List<Autor>>((ref) {
  return [];
});