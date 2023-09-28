
bool expEmail(String input) {
  var expRegNomApe = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  if(expRegNomApe.hasMatch(input)){
    return true;
  }
  return false;
}