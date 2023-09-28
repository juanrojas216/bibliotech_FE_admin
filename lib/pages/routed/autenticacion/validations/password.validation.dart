
import 'package:bibliotech_admin/config/validations/index.dart';

bool passwordValidacion(String password){
  if(!expPassword(password)) return false;
  return true;
}
