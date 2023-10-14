import 'package:pluto_grid/pluto_grid.dart';

import '../dto/usuario_prestamo.dto.dart';

List<PlutoRow> prestamoGetRows(List<PrestamoMultaDto> usuarios) {
  
  List<PlutoRow> rows = List.generate(
    usuarios.length,
    (index) => PlutoRow(
      cells: {
        'id': PlutoCell(value: usuarios[index].id),
        'publicacion': PlutoCell(value: usuarios[index].publicacion),
        'ejemplar': PlutoCell(value: usuarios[index].ejemplar),
        'estado': PlutoCell(value: usuarios[index].estado),
        'fecha_inicio': PlutoCell(value: usuarios[index].fechaInicio),
      },
      sortIdx: index,
    ),
  );

  return rows;
}
