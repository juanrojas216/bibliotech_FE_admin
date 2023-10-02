
bool soloNumeros(String input) {
  var reg = RegExp(r'^[0-9]+$');
  if(reg.hasMatch(input)){
    return true;
  }
  return false;
}