import 'dart:js_interop';

import 'package:bibliotech_admin/config/validations/index.dart';

import '../dto/search_prestamo.dart';


bool searchPrestamoValidacion(SearchPrestamoDto dto){
  if(dto.idEjemplar.isNull && dto.idPrestamo.isNull) return false;
  if(!dto.idPrestamo.isNull && (!soloNumeros(dto.idPrestamo!.toString()) || campoVacio(dto.idPrestamo.toString()))) return false; 
  if(!dto.idEjemplar.isNull && (!soloNumeros(dto.idEjemplar!) || campoVacio(dto.idEjemplar))) return false; 
  return true;
}