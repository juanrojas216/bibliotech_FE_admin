import 'package:bibliotech_admin/config/validations/index.dart';

bool isbnPublicacionValidacion(String isbn){
  if(campoVacio(isbn)) return false;
  return true;
}