

import 'package:bibliotech_admin/config/validations/index.dart';

bool biografiaAutorValidacion(String biografia){
  if(logitudMayor(biografia, 300)) return false;
  if(logitudMenor(biografia, 20)) return false;
  return true;
}