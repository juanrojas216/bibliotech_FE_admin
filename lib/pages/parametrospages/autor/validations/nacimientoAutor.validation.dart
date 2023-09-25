

import 'package:bibliotech_admin/config/validations/index.dart';

bool nacimientoAutorValidacion(DateTime nacimiento){
  if(menorFechaActual(nacimiento)) return true;
  return true;
}