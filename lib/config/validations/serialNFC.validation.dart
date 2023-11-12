
bool expSerialNFC(String input) {
  var expSerialCorto = RegExp(r'^[A-Z0-9-]{16}$');
  if(expSerialCorto.hasMatch(input)){
    return true;
  }
  return false;
}