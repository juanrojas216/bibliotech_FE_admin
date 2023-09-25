
bool expTitulo(String input) {
  var expRegNomApe = RegExp(r"/^[a-z0-9_-]{3,16}$/");
  if(expRegNomApe.hasMatch(input)){
    return true;
  }
  return false;
}