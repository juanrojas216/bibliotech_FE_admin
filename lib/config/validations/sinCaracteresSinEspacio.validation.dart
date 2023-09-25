
bool sinCarecteresSinEspacio(String input) {
  var exp = RegExp(r'^[a-zA-ZÁ-Úá-úñÑ]+$');
  if(exp.hasMatch(input)){
    return true;
  }
  return false;
}