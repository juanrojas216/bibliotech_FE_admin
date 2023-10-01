
import 'package:bibliotech_admin/new_models/index.dart';

List<Editorial> filtroEditorialProvider(String filtro, List<Editorial> editoriales) {

  var editorialesFiltradas = editoriales.where((e) => e.nombre.toLowerCase().contains(filtro.toLowerCase())).toList();

  return editorialesFiltradas;
}