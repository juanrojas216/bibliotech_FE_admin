import 'package:pluto_grid/pluto_grid.dart';
import '../dto/publicacion.dto.dart';

List<PlutoRow> getRows(List<PublicacionDto> publicaciones) {
  
  List<PlutoRow> rows = List.generate(
    publicaciones.length,
    (index) => PlutoRow(
      cells: {
        'titulo': PlutoCell(value: publicaciones[index].titulo),
        'autor': PlutoCell(value: publicaciones[index].autores.join(' - ')),
        'editorial': PlutoCell(value: publicaciones[index].editoriales.join(' - ')),
        'edicion': PlutoCell(value: publicaciones[index].edicion),
        'anio': PlutoCell(value: publicaciones[index].anio),
      },
      sortIdx: index,
    ),
  );

  return rows;
}
