
import '../dto/publicacion.dto.dart';
import 'index.dart';

bool publicacionValidacion(PublicacionDto publicacion){
  if(!tituloPublicacionValidacion(publicacion.tituloPublicacion)) return false;
  if(!anioPublicacionValidacion(publicacion.anioPublicacion)) return false;
  if(!isbnPublicacionValidacion(publicacion.isbnPublicacion)) return false;
  if(!autoresPublicacionValidacion(publicacion.autores)) return false;
  if(!categoriasPublicacionValidacion(publicacion.categorias)) return false;
  if(!editorialesPublicacionValidacion(publicacion.editoriales)) return false;
  if(!edicionPublicacionValidacion(publicacion.edicion)) return false;
  if(!linkPublicacionValidacion(publicacion.link)) return false;
  if(!tipoPublicacionValidacion(publicacion.tipo)) return false;
  if(!pagesPublicacionValidacion(publicacion.nroPaginas)) return false;
  if(!sinopsisValidacion(publicacion.sinopsis)) return false;
  return true;
}