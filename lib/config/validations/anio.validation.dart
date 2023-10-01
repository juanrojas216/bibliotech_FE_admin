bool anioValidation(String input) {
  var reg = RegExp(r'\b\d{4}\b');
  if(reg.hasMatch(input)){
    return true;
  }
  return false;
}