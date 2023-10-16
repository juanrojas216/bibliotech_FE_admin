
import 'dart:js_interop';

import 'package:bibliotech_admin/config/validations/index.dart';

bool searchPrestamoValidacion(String? dni, String? tituloPublicacion, DateTime? fechaDesde, DateTime? fechaHasta){

  if(campoVacio(dni) && campoVacio(tituloPublicacion) && fechaDesde.isNull && fechaHasta.isNull) return false;
  if(!fechaDesde.isNull && !fechaHasta.isNull && fechaDesde!.isAfter(fechaHasta!)) return false;
  return true;
}