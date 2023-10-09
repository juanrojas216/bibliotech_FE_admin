import 'dart:js_interop';

import 'package:bibliotech_admin/config/validations/index.dart';

import '../dto/search_usuario.dart';

bool searchUsuarioValidacion(SearchUsuarioDto dto){
  if(dto.apellido.isNull && dto.nombre.isNull && dto.idUsuario.isNull && dto.legajo.isNull) return false;
  if(!dto.apellido.isNull && (!sinCarecteresConEspacio(dto.apellido!) || campoVacio(dto.apellido))) return false; 
  if(!dto.nombre.isNull && (!sinCarecteresConEspacio(dto.nombre!) || campoVacio(dto.nombre))) return false; 
  if(!dto.legajo.isNull && (!soloNumeros(dto.legajo!) || campoVacio(dto.legajo))) return false; 
  if(!dto.idUsuario.isNull && (!soloNumeros(dto.idUsuario!) || campoVacio(dto.idUsuario))) return false; 
  return true;
}