

import 'package:bibliotech_admin/config/validations/index.dart';

bool nombreFacultadValidacion(String nombre){
  if(campoVacio(nombre)) return false;
  if(logitudMenor(nombre, 2)) return false;
  if(!sinCarecteresConEspacio(nombre)) return false;
  return true;
}