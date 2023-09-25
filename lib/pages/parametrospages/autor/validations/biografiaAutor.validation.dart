

import 'package:bibliotech_admin/config/validations/index.dart';

bool biografiaAutorValidacion(String biografia){
  if(logitudMayor(biografia, 60)) return false;
  if(logitudMenor(biografia, 10)) return false;
  return true;
}