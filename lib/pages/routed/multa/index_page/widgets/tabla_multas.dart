import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'acciones_multa.widget.dart';

class TablaMultas extends ConsumerStatefulWidget {
  
  final List<PlutoRow> rows;

  const TablaMultas({
    super.key,
    required this.rows,
  });

  @override
  TablaMultasState createState() => TablaMultasState();
}

class TablaMultasState extends ConsumerState<TablaMultas> {
  List<PlutoColumn> columns = [
    PlutoColumn(
      title: 'ID MULTA',
      field: 'idMulta',
      type: PlutoColumnType.text(),
      enableColumnDrag: false,
      readOnly: true,
    ),
    PlutoColumn(
        title: 'ID PRÉSTAMO',
        field: 'idPrestamo',
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
        title: 'TIPO MULTA',
        field: 'tipoMulta',
        type: PlutoColumnType.text(),
        enableColumnDrag: false,
        readOnly: true),
    PlutoColumn(
      title: 'ESTADO DE MULTA',
      field: 'estadoMulta',
      type: PlutoColumnType.select(['ACTIVADA', 'FINALIZADA', 'CANCELADA']),
      enableColumnDrag: false,
      readOnly: true,
      renderer: (rendererContext) {
        Color textColor = Colors.black;
        if (rendererContext.cell.value == 'ACTIVADA') {
          textColor = Colors.red;
        } else if (rendererContext.cell.value == 'FINALIZADA') {
          textColor = Colors.green;
        }
        return Text(
          rendererContext.cell.value.toString(),
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        );
      },
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
        accionesPublicacion(context, ref, e.rowIdx);
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
