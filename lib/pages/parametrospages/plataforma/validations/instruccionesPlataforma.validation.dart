

import 'package:bibliotech_admin/config/validations/index.dart';

bool instruccionesPlataformaValidacion(String instrucciones){
  if(logitudMayor(instrucciones, 60)) return false;
  if(logitudMenor(instrucciones, 10)) return false;
  return true;
}