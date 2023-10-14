import 'package:bibliotech_admin/pages/routed/multa/create_page/dto/usuario_multa.dto.dart';
import 'package:pluto_grid/pluto_grid.dart';

List<PlutoRow> usuarioGetRows(List<UsuarioMultaDto> usuarios) {
  
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
