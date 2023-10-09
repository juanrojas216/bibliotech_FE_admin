
import 'dart:js_interop';

import 'package:bibliotech_admin/config/validations/index.dart';

bool searchMultaValidacion(String? idPrestamo, String? idUsuario, DateTime? fechaDesde, DateTime? fechaHasta){

  if(campoVacio(idPrestamo) && campoVacio(idUsuario) && fechaDesde.isNull && fechaHasta.isNull) return false;
  if(!fechaDesde.isNull && !fechaHasta.isNull && fechaDesde!.isAfter(fechaHasta!)) return false;
  return true;
}