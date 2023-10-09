import 'package:bibliotech_admin/models/index.dart';

bool autoresPublicacionValidacion(List<Autor> autores){
  if(autores.isEmpty) return false;
  return true;
}