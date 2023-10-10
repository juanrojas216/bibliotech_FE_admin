import 'package:bibliotech_admin/models/index.dart';

List<Autor> filtroAutor(String filtro, List<Autor> autores) {

  var autoresFiltrados = autores.where((e) => e.nombre.toLowerCase().contains(filtro.toLowerCase())).toList();

  return autoresFiltrados;
}