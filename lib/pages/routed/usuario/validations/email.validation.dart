import 'package:bibliotech_admin/config/validations/index.dart';

bool emailUsuarioValidacion(String email){
  if(!expEmail(email)) return false;
  return true;
}