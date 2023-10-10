
import 'package:bibliotech_admin/config/validations/index.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/index_page/validations/anio.validation.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/index_page/validations/autor.validation.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/index_page/validations/isbn.validation.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/index_page/validations/titulo.validation.dart';

bool searchPublicacionValidacion(String? titulo, String? autor, String? anio, String? isbn){
  
  if(campoVacio(titulo) && campoVacio(autor) && campoVacio(anio) && campoVacio(isbn)) return false;
  if(!campoVacio(titulo) && !tituloPublicacionValidacion(titulo!)) return false; 
  if(!campoVacio(autor) && !autorPublicacionValidacion(autor!)) return false; 
  if(!campoVacio(anio) && !anioPublicacionValidacion(anio!)) return false; 
  if(!campoVacio(isbn) && !isbnPublicacionValidacion(isbn!)) return false; 
  return true;
}