import 'package:bibliotech_admin/pages/routed/publicacion/ejemplares_page/dto/create_ejemplar.dto.dart';

import 'idpublicacion.validation.dart';
import 'idubicacion.validation.dart';
// import 'idusuario.validation.dart';
import 'nfc.validation.dart';

bool ejemplarValidacion(EjemplarDto dto){
  if(!nfcEjemplarValidacion(dto.serialNFC)) return false;
  if(!idPublicacionEjemplarValidacion(dto.publicacionId)) return false;
  // if(!idUsuarioEjemplarValidacion(dto.usuarioId)) return false;
  if(!idUbicacionEjemplarValidacion(dto.ubicacionId)) return false;
  return true;
}