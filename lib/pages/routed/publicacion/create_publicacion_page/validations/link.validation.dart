import 'dart:js_interop';
import 'package:bibliotech_admin/config/validations/index.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/create_publicacion_page/dto/link.dto.dart';

bool linkPublicacionValidacion(LinkDto link){
  if(link.estado.isNull) return false;
  if(link.plataformaId.isNull) return false;
  if(link.url.isNull) return false;
  if(!isUrl(link.url!)) return false;
  return true;
}