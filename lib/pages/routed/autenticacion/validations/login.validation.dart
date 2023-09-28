
import 'email.validation.dart';
import 'password.validation.dart';

bool loginValidacion(String email, String password){
  if(!emailValidacion(email)) return false;
  if(!passwordValidacion(password)) return false;
  return true;
}