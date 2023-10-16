import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../pages/detalle_prestamo.page.dart';
import 'acciones_prestamo.widget.dart';

class TablaPrestamos extends ConsumerStatefulWidget {
  
  final List<PlutoRow> rows;

  const TablaPrestamos({
    super.key,
    required this.rows,
  });

  @override
  TablaPrestamosState createState() => TablaPrestamosState();
}

class TablaPrestamosState extends ConsumerState<TablaPrestamos> {
  
  List<PlutoColumn> columns = [
    PlutoColumn(
      title: 'ID PRESTAMO',
      field: 'id',
      type: PlutoColumnType.text(),
      enableColumnDrag: false,
      readOnly: true,
    ),
    PlutoColumn(
        title: 'PUBLICACION',
        field: 'publicacion',
        type: PlutoColumnType.text(),
        enableColumnDrag: false,
        readOnly: true),
    PlutoColumn(
        title: 'ID EJEMPLAR',
        field: 'idEjemplar',
        type: PlutoColumnType.text(),
        enableColumnDrag: false,
        readOnly: true),
    PlutoColumn(
        title: 'ID USUARIO',
        field: 'idUsuario',
        type: PlutoColumnType.text(),
        enableColumnDrag: false,
        readOnly: true),
    PlutoColumn(
      title: 'ESTADO DE PRESTAMO',
      field: 'estadoPrestamo',
      type: PlutoColumnType.text(),
      enableColumnDrag: false,
      readOnly: true,
    ),
    PlutoColumn(
        title: 'FECHA DESDE',
        field: 'fechaDesde',
        type: PlutoColumnType.date(),
        enableColumnDrag: false,
        readOnly: true),
    PlutoColumn(
        title: 'FECHA HASTA',
        field: 'fechaHasta',
        type: PlutoColumnType.date(),
        enableColumnDrag: false,
        readOnly: true),
  ];

  @override
  Widget build(BuildContext context) {
    return PlutoGrid(
      noRowsWidget: IgnorePointer(
        child: Center(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.info_outline),
                  SizedBox(height: 5),
                  Text('No se han encontrado multas'),
                ],
              ),
            ),
          ),
        ),
      ),
      configuration: PlutoGridConfiguration(
        columnFilter: PlutoGridColumnFilterConfig(
          filters: [...FilterHelper.defaultFilters],
          resolveDefaultColumnFilter: (column, resolver) =>
              resolver<PlutoFilterTypeContains>() as PlutoFilterType,
        ),
        style: PlutoGridStyleConfig(
          enableCellBorderVertical: false,
          gridBorderRadius: const BorderRadius.all(Radius.circular(16)),
          gridPopupBorderRadius: const BorderRadius.all(Radius.circular(16)),
          activatedBorderColor: Colors.purple.shade100,
          enableRowColorAnimation: true,
          gridBackgroundColor: Colors.transparent,
          iconColor: Colors.black,
          activatedColor: Colors.purple.shade100,
        ),
        columnSize: const PlutoGridColumnSizeConfig(
          autoSizeMode: PlutoAutoSizeMode.scale,
        ),
      ),
      mode: PlutoGridMode.select,
      onRowDoubleTap: (e) {
        final idPrestamo = e.row.cells.entries.firstWhere((e) => e.key == 'id').value.value;
        accionesPrestamo(context, ref, idPrestamo);
      },
      createFooter: (stateManager) {
        stateManager.setPageSize(20, notify: true);
        return PlutoPagination(stateManager);
      },
      createHeader: (state) {
        state.headerHeight = 10;
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  state.showSetColumnsPopup(context);
                },
                child: AutoSizeText(
                  'Seleccionar columnas',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  state.setShowColumnFilter(!state.showColumnFilter);
                },
                child: AutoSizeText(
                  'Mostrar filtros',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        );
      },
      columns: columns,
      rows: widget.rows,
    );
  }
}
