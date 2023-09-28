
bool expPassword(String input) {
  var exp = RegExp(r'^(?=.*[a-zA-Z])(?=.*\d).{8,}$');
  if(exp.hasMatch(input)){
    return true;
  }
  return false;
}