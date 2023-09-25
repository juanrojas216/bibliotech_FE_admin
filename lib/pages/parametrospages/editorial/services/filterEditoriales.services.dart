

import 'package:bibliotech_admin/new_models/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/editorial/repository/editoriales.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filtroEditorialesProvider = Provider.family<List<Editorial>, String>((ref, filtro) {
  var editoriales = ref.watch(editorialesProvider);
  editoriales = editoriales.where((e) => e.nombre.toLowerCase().contains(filtro.toLowerCase())).toList();
  return editoriales;
});