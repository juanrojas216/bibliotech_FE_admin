import 'package:bibliotech_admin/config/validations/index.dart';

import '../dto/parametro_prestamo.dto.dart';

bool parametroPrestamoValidacion(ParametrosPrestamoDto dto){
  if(campoVacio(dto.cantidadMaximaRenovacion.toString())) return false;
  if(campoVacio(dto.diasMaximoPrestamo.toString())) return false;
  if(campoVacio(dto.diasMaximoRenovacion.toString())) return false;
  return true;
}