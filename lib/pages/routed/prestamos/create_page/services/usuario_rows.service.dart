import 'package:pluto_grid/pluto_grid.dart';

import '../dto/usuario_prestamo.dto.dart';

List<PlutoRow> usuarioGetRows(List<UsuarioPrestamoDto> usuarios) {
  
  List<PlutoRow> rows = List.generate(
    usuarios.length,
    (index) => PlutoRow(
      cells: {
        'id': PlutoCell(value: usuarios[index].id),
        'dni': PlutoCell(value: usuarios[index].dni),
        'legajo': PlutoCell(value: usuarios[index].legajo),
        'nombre': PlutoCell(value: usuarios[index].nombre),
      },
      sortIdx: index,
    ),
  );

  return rows;
}
