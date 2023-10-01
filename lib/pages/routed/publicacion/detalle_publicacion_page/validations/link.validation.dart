import 'dart:js_interop';
import 'package:bibliotech_admin/config/validations/index.dart';
import 'package:bibliotech_admin/new_models/index.dart';

bool linkPublicacionValidacion(Link link){
  if(link.estado.isNull) return false;
  if(link.plataforma.isNull) return false;
  if(link.url.isNull) return false;
  if(!isUrl(link.url)) return false;
  return true;
}