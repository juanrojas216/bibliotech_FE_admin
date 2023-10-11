import 'package:bibliotech_admin/config/validations/index.dart';

bool nombreUsuarioValidacion(String nombre){
  if(logitudMenor(nombre, 3)) return false;
  if(!expNombre(nombre)) return false;
  return true;
}