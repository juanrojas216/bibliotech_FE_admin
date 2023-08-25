import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:auto_size_text/auto_size_text.dart';

class TablaPublicaciones extends StatelessWidget {
  const TablaPublicaciones({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PlutoGrid(
        configuration: PlutoGridConfiguration(
          columnFilter: PlutoGridColumnFilterConfig(
            filters: [...FilterHelper.defaultFilters],
            resolveDefaultColumnFilter: (column, resolver) =>
                resolver<PlutoFilterTypeContains>() as PlutoFilterType,
          ),
          style: PlutoGridStyleConfig(
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
        onRowDoubleTap: (e) {},
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
              ],
            ),
          );
        },
        columns: [
          PlutoColumn(
            title: 'Título',
            field: 'titulo',
            type: PlutoColumnType.text(),
            enableColumnDrag: false,
            readOnly: true,
            renderer: (rendererContext) => Row(
              children: [
                IconButton.outlined(
                  icon: const Icon(Icons.edit),
                  onPressed: () {},
                  iconSize: 18,
                  color: Colors.purple,
                  padding: const EdgeInsets.all(0),
                ),
                Expanded(
                  child: Text(
                    rendererContext
                        .row.cells[rendererContext.column.field]!.value
                        .toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          PlutoColumn(
              title: 'Autor',
              field: 'autor',
              type: PlutoColumnType.text(),
              enableColumnDrag: false,
              readOnly: true),
          PlutoColumn(
              title: 'Editorial',
              field: 'editorial',
              type: PlutoColumnType.text(),
              enableColumnDrag: false,
              readOnly: true),
          PlutoColumn(
              title: 'Edición',
              field: 'edicion',
              type: PlutoColumnType.text(),
              enableColumnDrag: false,
              readOnly: true),
          PlutoColumn(
              title: 'Año',
              field: 'anio',
              type: PlutoColumnType.number(format: '####', negative: false),
              enableColumnDrag: false,
              readOnly: true),
        ],
        rows: List.generate(
          100,
          (index) => PlutoRow(
            cells: {
              'titulo': PlutoCell(value: 'Harry Potter y la piedra filosofal'),
              'autor': PlutoCell(value: 'J.K. Rowling'),
              'editorial': PlutoCell(value: 'Salamandra'),
              'edicion': PlutoCell(value: '20 Aniversario'),
              'anio': PlutoCell(value: 2020),
            },
            sortIdx: index,
          ),
        ));
  }
}
