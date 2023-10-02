
bool expSerialNFC(String input) {
  var expRegNomApe = RegExp(r'^[A-Z0-9-]{16}$');
  if(expRegNomApe.hasMatch(input)){
    return true;
  }
  return false;
}