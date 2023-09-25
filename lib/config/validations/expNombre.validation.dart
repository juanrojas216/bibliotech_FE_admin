

bool expNombre(String input) {
  var expRegNomApe = RegExp(r"^[a-zA-ZÁ-Úá-úñÑ\s\']+$");
  if(expRegNomApe.hasMatch(input)){
    return true;
  }
  return false;
}