
import 'dart:js_interop';

import '../dto/detalleUsuario.dto.dart';
import 'email.validation.dart';
import 'nombre.validation.dart';
import 'password.validation.dart';

bool updateUsuarioValidacion(DetalleUsuarioDto? dto) {
  if( dto.isNull ) return false;
  if (dto!.nombre.isNull ||
      dto.email.isNull ||
      dto.apellido.isNull ||
      dto.roles.isEmpty) return false;
  if (!nombreUsuarioValidacion(dto.nombre!)) return false;
  if (!nombreUsuarioValidacion(dto.apellido!)) return false;
  if (!emailUsuarioValidacion(dto.email!)) return false;
  if (!dto.password.isNull && !passwordUsuarioValidacion(dto.password!)) return false;
  return true;
}
