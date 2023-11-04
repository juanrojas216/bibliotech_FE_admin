
bool expTitulo(String input) {
  var expRegNomApe = RegExp(r'^[a-zA-Z0-9\s]*$');
  if(expRegNomApe.hasMatch(input)){
    return true;
  }
  return false;
}