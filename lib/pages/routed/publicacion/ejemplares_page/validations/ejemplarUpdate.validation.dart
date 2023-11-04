
import '../dto/ejemplar_item.dto.dart';
import 'idubicacion.validation.dart';
import 'nfc.validation.dart';

bool ejemplarUpdateValidacion(EjemplarItemDto ejemplar){
  
  if(!nfcEjemplarValidacion(ejemplar.serialNfc.toString())) return false;
  // if(!idUsuarioEjemplarValidacion(ejemplar.usuarioId)) return false;
  if(!idUbicacionEjemplarValidacion(ejemplar.ubicacion.id)) return false;
  return true;
}