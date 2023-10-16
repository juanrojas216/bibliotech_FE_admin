import 'package:pluto_grid/pluto_grid.dart';
import '../dto/tabla_prestamo.dto.dart';

List<PlutoRow> getRows(List<PrestamoItemTablaDto> prestamos) {
  
  List<PlutoRow> rows = List.generate(
    prestamos.length,
    (index) => PlutoRow(
      cells: {
        'id': PlutoCell(value: prestamos[index].id),
        'publicacion': PlutoCell(value: prestamos[index].tituloPublicacion),
        'idEjemplar': PlutoCell(value: prestamos[index].idEjemplar),
        'idUsuario': PlutoCell(value: prestamos[index].idUsuario),
        'estadoPrestamo': PlutoCell(value: prestamos[index].estado),
        'fechaDesde': PlutoCell(value: prestamos[index].fechaDesde),
        'fechaHasta': PlutoCell(value: prestamos[index].fechaHasta),
      },
      sortIdx: index,
    ),
  );

  return rows;
}
