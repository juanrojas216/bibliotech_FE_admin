import 'package:pluto_grid/pluto_grid.dart';

import '../dto/publicacion_prestamo.dto.dart';

List<PlutoRow> publicacionGetRows(List<PublicacionPrestamoDto> publicacion) {
  List<PlutoRow> rows = List.generate(
    publicacion.length,
    (index) => PlutoRow(
      cells: {
        'id': PlutoCell(value: publicacion[index].id),
        //'isbn': PlutoCell(value: publicacion[index].isbn),
        'titulo': PlutoCell(value: publicacion[index].titulo),
        'anio': PlutoCell(value: publicacion[index].anio),
        'autores': PlutoCell(value: publicacion[index].autores.join(' - ')),
        'edicion': PlutoCell(value: publicacion[index].edicion),
        'editorial': PlutoCell(value: publicacion[index].editorial),
        //'editoriales': PlutoCell(value: publicacion[index].editoriales.join(' - ')),
      },
      sortIdx: index,
    ),
  );

  return rows;
}
