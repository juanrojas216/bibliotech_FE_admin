import 'package:bibliotech_admin/models/index.dart';

bool categoriasPublicacionValidacion(List<CategoriaPublicacion> categorias){
  if(categorias.isEmpty) return false;
  return true;
}