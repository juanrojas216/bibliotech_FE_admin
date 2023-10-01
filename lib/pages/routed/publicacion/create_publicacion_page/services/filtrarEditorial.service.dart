
import 'package:bibliotech_admin/new_models/index.dart';

List<Editorial> filtroEditorial(String filtro, List<Editorial> editoriales) {

  var editorialesFiltradas = editoriales.where((e) => e.nombre.toLowerCase().contains(filtro.toLowerCase())).toList();

  return editorialesFiltradas;
}