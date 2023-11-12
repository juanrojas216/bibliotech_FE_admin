import 'package:bibliotech_admin/config/validations/index.dart';

bool sinopsisValidacion(String sinopsis){
  if(campoVacio(sinopsis)) return false;
  if(logitudMenor(sinopsis, 3)) return false;
  if(logitudMayor(sinopsis, 5000)) return false;
  return true;
}