
bool sinCarecteresConEspacio(String input) {
  final exp = RegExp(r'^[a-zA-ZÁ-Úá-úñÑ\s]+$');
  if(exp.hasMatch(input.split(' ').join(''))){
    return true;
  }
  return false;
}