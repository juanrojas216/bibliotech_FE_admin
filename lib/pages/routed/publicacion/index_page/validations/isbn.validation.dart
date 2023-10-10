import 'package:bibliotech_admin/config/validations/index.dart';

bool isbnPublicacionValidacion(String isbn){
  if(logitudMenor(isbn, 3)) return false;
  return true;
}