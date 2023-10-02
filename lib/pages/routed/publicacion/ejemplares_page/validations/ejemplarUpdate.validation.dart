import 'package:bibliotech_admin/new_models/index.dart';

import 'idubicacion.validation.dart';
// import 'idusuario.validation.dart';
import 'nfc.validation.dart';

bool ejemplarUpdateValidacion(Ejemplar ejemplar){
  
  if(!nfcEjemplarValidacion(ejemplar.serialNfc.toString())) return false;
  // if(!idUsuarioEjemplarValidacion(ejemplar.usuarioId)) return false;
  if(!idUbicacionEjemplarValidacion(ejemplar.ubicacion?.id)) return false;
  return true;
}