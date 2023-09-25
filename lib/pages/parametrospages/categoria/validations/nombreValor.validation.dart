import 'package:bibliotech_admin/config/validations/index.dart';

bool nombreValorValidacion(String nombre){
  if(campoVacio(nombre)) return false;
  if(logitudMenor(nombre, 5)) return false;
  if(!sinCarecteresConEspacio(nombre)) return false;
  return true;
}