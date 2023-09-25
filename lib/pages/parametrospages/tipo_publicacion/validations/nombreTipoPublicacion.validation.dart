

import 'package:bibliotech_admin/config/validations/index.dart';

bool nombreTipoPublicacionValidacion(String nombre){
  if(campoVacio(nombre)) return false;
  if(logitudMenor(nombre, 5)) return false;
  if(!sinCarecteresConEspacio(nombre)) return false;
  return true;
}