

import 'package:bibliotech_admin/config/validations/index.dart';

bool instruccionesPlataformaValidacion(String instrucciones){
  if(logitudMayor(instrucciones, 200)) return false;
  if(logitudMenor(instrucciones, 10)) return false;
  return true;
}