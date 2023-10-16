
import 'package:pluto_grid/pluto_grid.dart';

import '../dto/lista_usuario.dto.dart';

List<PlutoRow> getRows(List<ListaUsuarioDto> usuarios) {
  
  List<PlutoRow> rows = List.generate(
    usuarios.length,
    (index) => PlutoRow(
      cells: {
        'id': PlutoCell(value: usuarios[index].id),
        'roles': PlutoCell(value: usuarios[index].roles.join(' - ')),
        'name': PlutoCell(value: usuarios[index].nombre),
      },
      sortIdx: usuarios[index].id,
    ),
  );

  return rows;
}
