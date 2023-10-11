import 'dart:js_interop';


import 'email.validation.dart';
import 'nombre.validation.dart';
import 'password.validation.dart';

bool usuarioValidacion(dto) {
  if (dto.nombre.isNull ||
      dto.email.isNull ||
      dto.apellido.isNull ||
      dto.password.isNull ||
      dto.roles.isEmpty) return false;
  if (!nombreUsuarioValidacion(dto.nombre!)) return false;
  if (!nombreUsuarioValidacion(dto.apellido!)) return false;
  if (!passwordUsuarioValidacion(dto.password!)) return false;
  if (!emailUsuarioValidacion(dto.email!)) return false;
  return true;
}
