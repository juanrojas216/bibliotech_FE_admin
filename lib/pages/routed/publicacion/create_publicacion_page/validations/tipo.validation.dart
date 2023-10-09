import 'dart:js_interop';

import 'package:bibliotech_admin/models/index.dart';

bool tipoPublicacionValidacion(TipoPublicacion? tipo){
  if(tipo.isNull) return false;
  return true;
}