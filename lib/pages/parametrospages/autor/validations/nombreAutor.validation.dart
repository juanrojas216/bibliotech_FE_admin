
import 'package:bibliotech_admin/config/validations/index.dart';

bool nombreAutorValidacion(String nombre){
  if(campoVacio(nombre)) return false;
  if(logitudMenor(nombre, 3)) return false;
  if(!expNombre(nombre)) return false;
  return true;
}