
import 'dart:js_interop';

bool campoVacio(String? input) {
  if(input.isNull) return true;
  if(input!.trim().isEmpty){
    return true;
  }
  return false;
}