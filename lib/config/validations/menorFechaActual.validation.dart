
bool menorFechaActual(DateTime fecha){
  if(fecha.isAfter(DateTime.now())) return false;
  return true;
}