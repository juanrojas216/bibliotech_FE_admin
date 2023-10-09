import 'package:bibliotech_admin/config/validations/index.dart';

bool autorPublicacionValidacion(String autor){
  if(logitudMenor(autor, 3)) return false;
  if(!expNombre(autor)) return false;
  return true;
}