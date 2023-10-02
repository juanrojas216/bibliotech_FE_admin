import 'dart:js_interop';

import 'package:bibliotech_admin/config/validations/index.dart';

bool idUbicacionEjemplarValidacion(int? id){
  if(id.isNull) return true;
  if(campoVacio(id.toString())) return false;
  if(!soloNumeros(id.toString())) return false;
  return true;
}