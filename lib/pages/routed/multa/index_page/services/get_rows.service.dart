import 'package:pluto_grid/pluto_grid.dart';
import '../dto/tabla_multa.dto.dart';

List<PlutoRow> getRows(List<MultaItemTablaDto> multas) {
  
  List<PlutoRow> rows = List.generate(
    multas.length,
    (index) => PlutoRow(
      cells: {
        'idMulta': PlutoCell(value: multas[index].id),
        'idPrestamo': PlutoCell(value: multas[index].idPrestamo),
        'idUsuario': PlutoCell(value: multas[index].idUsuario),
        'tipoMulta': PlutoCell(value: multas[index].tipo),
        'estadoMulta': PlutoCell(value: multas[index].estado),
        'fechaDesde': PlutoCell(value: multas[index].fechaDesde),
        'fechaHasta': PlutoCell(value: multas[index].fechaHasta),
      },
      sortIdx: index,
    ),
  );

  return rows;
}
