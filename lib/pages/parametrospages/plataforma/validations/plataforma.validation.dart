


import 'instruccionesPlataforma.validation.dart';
import 'nombrePlataforma.validation.dart';
import 'urlPlataforma.validation.dart';

bool plataformaValidacion(String nombre, String url, String instrucciones){
  if(!nombrePlataformaValidacion(nombre)) return false;
  if(!urlPlataformaValidacion(url)) return false;
  if(!instruccionesPlataformaValidacion(instrucciones)) return false;
  return true;
}