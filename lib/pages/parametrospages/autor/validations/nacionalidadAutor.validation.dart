
import 'package:bibliotech_admin/config/validations/index.dart';

bool nacionlidadAutorValidacion(String nacionalidad){
  if(campoVacio(nacionalidad)) return false;
  if(logitudMenor(nacionalidad, 2)) return false;
  if(!sinCarecteresConEspacio(nacionalidad)) return false;
  return true;
}