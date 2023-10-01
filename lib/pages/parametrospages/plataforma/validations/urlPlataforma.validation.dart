

import 'package:bibliotech_admin/config/validations/index.dart';

bool urlPlataformaValidacion(String url){
  if(campoVacio(url)) return false;
  if(!isUrl(url)) return false;
  return true;
}