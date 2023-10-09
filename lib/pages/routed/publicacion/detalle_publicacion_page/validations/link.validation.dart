import 'dart:js_interop';
import 'package:bibliotech_admin/config/validations/index.dart';
import 'package:bibliotech_admin/models/index.dart';

bool linkPublicacionValidacion(Link link){
  if(link.estado.isNull && (!link.plataforma.isNull || !link.url.isNull)) return false;
  if(link.url.isNull && (!link.plataforma.isNull || !link.estado.isNull))  return false;
  if(link.plataforma.isNull && (!link.url.isNull || !link.estado.isNull))  return false;
  if(!link.url.isNull && !isUrl(link.url!)) return false;
  return true;
}