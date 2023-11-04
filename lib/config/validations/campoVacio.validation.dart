bool campoVacio(String? input) {
  if(input == null) return true;
  if(input.trim().isEmpty){
    return true;
  }
  return false;
}