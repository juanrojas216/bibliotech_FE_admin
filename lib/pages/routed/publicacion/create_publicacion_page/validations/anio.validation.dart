import 'package:bibliotech_admin/config/validations/index.dart';

bool anioPublicacionValidacion(int anio){
  if(!anioValidation(anio.toString())) return false;
  return true;
}