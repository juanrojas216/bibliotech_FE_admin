

import 'package:bibliotech_admin/config/validations/index.dart';

bool emailValidacion(String email){
  if(!expEmail(email)) return false;
  return true;
}