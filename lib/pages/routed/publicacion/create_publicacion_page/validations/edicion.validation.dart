import 'dart:js_interop';

import 'package:bibliotech_admin/new_models/index.dart';

bool edicionPublicacionValidacion(Edicion? edicion){
  if(edicion.isNull) return false;
  return true;
}