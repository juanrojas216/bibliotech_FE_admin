import 'package:bibliotech_admin/config/validations/index.dart';

import '../dto/create_parametro_multa.dto.dart';
import '../dto/parametro_multa.dto.dart';

bool parametroMultaValidacion(ParametroMultaDto dto){
  if(campoVacio(dto.nombre)) return false;
  if(campoVacio(dto.dias.toString())) return false;
  if(!logitudMayor(dto.nombre, 3)) return false;
  if(!soloNumeros(dto.dias.toString())) return false;
  return true;
}

bool createParametroMultaValidacion(CreateParametroMultaDto dto){
  if(campoVacio(dto.nombre)) return false;
  if(campoVacio(dto.dias.toString())) return false;
  if(!logitudMayor(dto.nombre!, 3)) return false;
  if(!soloNumeros(dto.dias.toString())) return false;
  return true;
}