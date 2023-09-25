
import 'package:bibliotech_admin/pages/parametrospages/autor/dto/autor.dto.dart';
import 'package:bibliotech_admin/pages/parametrospages/autor/validations/biografiaAutor.validation.dart';
import 'package:bibliotech_admin/pages/parametrospages/autor/validations/nacimientoAutor.validation.dart';
import 'package:bibliotech_admin/pages/parametrospages/autor/validations/nacionalidadAutor.validation.dart';
import 'package:bibliotech_admin/pages/parametrospages/autor/validations/nombreAutor.validation.dart';

bool resumenAutorValidacion(AutorDto autor){
  if(!nombreAutorValidacion(autor.nombre)) return false;
  if(!nacimientoAutorValidacion(autor.fechaNacimiento)) return false;
  if(!biografiaAutorValidacion(autor.biografia)) return false;
  if(!nacionlidadAutorValidacion(autor.nacionalidad)) return false;
  return true;
}