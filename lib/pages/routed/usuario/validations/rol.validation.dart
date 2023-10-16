


import 'dart:js_interop';


import '../../../../config/validations/index.dart';
import '../dto/roles_usuario.dto.dart';

bool rolValidacion(Entidad? entidad, String? nombre, List<Privilegio> privilegio) {
  if (entidad.isNull || nombre.isNull) return false;
  if (campoVacio(nombre!)) return false;
  if (!sinCarecteresConEspacio(nombre)) return false;
  return true;
}