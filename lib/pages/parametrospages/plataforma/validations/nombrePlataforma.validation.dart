

import 'package:bibliotech_admin/config/validations/index.dart';

bool nombrePlataformaValidacion(String nombre){
  if(campoVacio(nombre)) return false;
  if(logitudMenor(nombre, 2)) return false;
  return true;
}