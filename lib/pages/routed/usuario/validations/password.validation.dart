import 'package:bibliotech_admin/config/validations/index.dart';

bool passwordUsuarioValidacion(String password){
  if(!expPassword(password)) return false;
  return true;
}