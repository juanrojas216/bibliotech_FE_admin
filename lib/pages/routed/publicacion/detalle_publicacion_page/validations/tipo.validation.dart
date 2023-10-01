import 'dart:js_interop';

import 'package:bibliotech_admin/new_models/index.dart';

bool tipoPublicacionValidacion(TipoPublicacion? tipo){
  if(tipo.isNull) return false;
  return true;
}