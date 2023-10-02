import 'dart:js_interop';

import 'package:bibliotech_admin/config/validations/index.dart';

bool idUsuarioEjemplarValidacion(int? id){
  if(id.isNull) return false;
  if(campoVacio(id.toString())) return false;
  if(!soloNumeros(id.toString())) return false;
  return true;
}