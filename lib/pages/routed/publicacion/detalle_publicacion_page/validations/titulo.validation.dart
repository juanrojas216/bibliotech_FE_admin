import 'package:bibliotech_admin/config/validations/index.dart';

bool tituloPublicacionValidacion(String titulo){
  if(!campoVacio(titulo)) return false;
  if(!expTitulo(titulo)) return false;
  return true;
}