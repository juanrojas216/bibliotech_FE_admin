import 'package:bibliotech_admin/new_models/index.dart';
import 'package:pluto_grid/pluto_grid.dart';

List<PlutoRow> getRows(List<Publicacion> publicaciones) {
  
  List<PlutoRow> rows = List.generate(
    publicaciones.length,
    (index) => PlutoRow(
      cells: {
        'titulo': PlutoCell(value: publicaciones[index].tituloPublicacion),
        'autor': PlutoCell(value: publicaciones[index].autores.join(' - ')),
        'editorial': PlutoCell(value: publicaciones[index].editoriales.join(' - ')),
        'edicion': PlutoCell(value: publicaciones[index].edicion),
        'anio': PlutoCell(value: publicaciones[index].anioPublicacion),
      },
      sortIdx: index,
    ),
  );

  return rows;
}
