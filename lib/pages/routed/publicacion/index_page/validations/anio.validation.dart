
import 'package:bibliotech_admin/config/validations/index.dart';

bool anioPublicacionValidacion(String anio){
  if(logitudMenor(anio, 4)) return false;
  return true;
}