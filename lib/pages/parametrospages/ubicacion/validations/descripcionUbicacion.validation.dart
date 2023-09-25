

import 'package:bibliotech_admin/config/validations/index.dart';

bool descripcionUbicacionValidacion(String descripcion){
  if(logitudMayor(descripcion, 10)) return false;
  if(logitudMenor(descripcion, 2)) return false;
  return true;
}