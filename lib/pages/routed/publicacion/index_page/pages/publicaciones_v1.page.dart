// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:bibliotech_admin/pages/routed/publicacion/index_page/publicacion_controller.dart';
// import 'package:bibliotech_admin/widgets/menubutton.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:layout/layout.dart';

// import '../widgets/index.dart';

// class PublicacionesPage extends StatelessWidget {
  
//   const PublicacionesPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: const MenuButton(),
//         elevation: 0,
//         title: AutoSizeText('PUBLICACIONES',
//             style: GoogleFonts.poppins(color: Colors.black)),
//         backgroundColor: Colors.white,
//         actions: const [
//           Padding(
//             padding: EdgeInsets.symmetric(vertical: 10),
//             child: NuevaPublicacion(),
//           ),
//           SizedBox(width: 20),
//           Padding(
//             padding: EdgeInsets.symmetric(vertical: 10),
//             child: ParametrosPopUp(),
//           ),
//           VerticalDivider(),
//           Padding(
//             padding: EdgeInsets.symmetric(vertical: 10),
//             child: SizedBox(width: 280, child: Center(child: MostrarUsuario())),
//           ),
//           SizedBox(width: 20),
//         ],
//       ),
//       body: const Margin(
//         child: Column(
//           children: [
//             SizedBox(height: 20),
//             InputBusqueda(),
//             SizedBox(height: 5),
//             Resultados(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class BotonBusqueda extends ConsumerWidget {
//   const BotonBusqueda({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     var inputTituloBusqueda = ref.watch(entradaBusquedaTituloProvider);
//     var inputAutorBusqueda = ref.watch(entradaBusquedaAutorProvider);
//     var inputAnioBusqueda = ref.watch(entradaBusquedaAnioProvider);
//     var inputISBNBusqueda = ref.watch(entradaBusquedaISBNProvider);

//     return ElevatedButton(
//       style: ButtonStyle(
//           backgroundColor: (inputTituloBusqueda.trim().isEmpty &&
//                   inputAutorBusqueda.trim().isEmpty &&
//                   inputAnioBusqueda.trim().isEmpty &&
//                   inputISBNBusqueda.trim().isEmpty)
//               ? const MaterialStatePropertyAll(Colors.grey)
//               : const MaterialStatePropertyAll(Colors.purple)),
//       onPressed: () {
//         if (inputTituloBusqueda.trim().isEmpty &&
//             inputAutorBusqueda.trim().isEmpty &&
//             inputAnioBusqueda.trim().isEmpty &&
//             inputISBNBusqueda.trim().isEmpty) {
//           ref.read(mostrarResultadosProvider.notifier).update((state) => false);
//           return;
//         }
//         ref.read(mostrarResultadosProvider.notifier).update((state) => true);
//         ref.invalidate(tablaResultadosProvider);
//       },
//       child: Text('Buscar resultados', style: GoogleFonts.poppins()),
//     );
//   }
// }

// class Resultados extends ConsumerWidget {
  
//   const Resultados({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     var tablaResultados = ref.watch(tablaResultadosProvider);
//     var mostrarResultados = ref.watch(mostrarResultadosProvider);

//     return Expanded(
//       child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10),
//           child: Visibility(
//             visible: mostrarResultados,
//             replacement: Visibility(
//               visible: !mostrarResultados,
//               child: IgnorePointer(
//                 child: Center(
//                   child: DecoratedBox(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       border: Border.all(),
//                       borderRadius: const BorderRadius.all(Radius.circular(5)),
//                     ),
//                     child: const Padding(
//                       padding: EdgeInsets.all(10),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(Icons.info_outline),
//                           SizedBox(height: 5),
//                           Text('Debe llenar al menos 1 campo de búsqueda'),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             child: tablaResultados.when(
//               skipError: true,
//               skipLoadingOnRefresh: false,
//               error: (_, __) => const SizedBox(),
//               data: (data) => data,
//               loading: () => const Center(
//                 child: CircularProgressIndicator(),
//               ),
//             ),
//           )),
//     );
//   }
// }

/*
class RowLazyPaginationScreen extends ConsumerStatefulWidget {
  const RowLazyPaginationScreen({Key? key}) : super(key: key);

  @override
  RowLazyPaginationScreenState createState() => RowLazyPaginationScreenState();
}

class RowLazyPaginationScreenState
    extends ConsumerState<RowLazyPaginationScreen> {
  late final PlutoGridStateManager stateManager;

  final List<PlutoColumn> columns = [
    PlutoColumn(
      title: 'ID',
      field: 'ID',
      type: PlutoColumnType.number(),
    ),
    PlutoColumn(title: 'NOMBRE', field: 'NOMBRE', type: PlutoColumnType.text()),
    PlutoColumn(title: 'YEAR', field: 'YEAR', type: PlutoColumnType.number()),
    PlutoColumn(title: 'COLOR', field: 'COLOR', type: PlutoColumnType.text()),
    PlutoColumn(
        title: 'PANTONE-VALUE',
        field: 'PANTONE-VALUE',
        type: PlutoColumnType.text()),
  ];

  final List<PlutoRow> rows = [];

  Future<PlutoLazyPaginationResponse> fetch(
      PlutoLazyPaginationRequest request) async {
    HtttpResult<PublicacionPaginated> response;

    if (request.filterRows.isNotEmpty) {
      response = await Http(baseUrl: 'https://reqres.in')
          .request<PublicacionPaginated>(
        '/api/unknown',
        method: HttpMethod.get,
        parser: publicacionPaginatedFromJson,
        // body: FilterHelper.convertRowsToMap(request.filterRows),
        // queryParameters: FilterHelper.convertRowsToMap(request.filterRows)
        //     .map((key, value) => MapEntry(key, jsonEncode(value))),
      );

      print(jsonEncode(FilterHelper.convertRowsToMap(request.filterRows)));

      // final filter = FilterHelper.convertRowsToFilter(
      //   request.filterRows,
      //   stateManager.refColumns,
      // );

      // print(FilterHelper.convertRowsToMap(request.filterRows));

      // tempList = tempList.where(filter!).toList();
    } else {
      response = await Http(baseUrl: 'https://reqres.in')
          .request<PublicacionPaginated>('/api/unknown',
              parser: publicacionPaginatedFromJson);
    }

    List<PlutoRow> tempList = response.data!.data!
        .map((e) => PlutoRow(cells: {
              'ID': PlutoCell(value: e.id),
              'NOMBRE': PlutoCell(value: e.name),
              'YEAR': PlutoCell(value: e.year),
              'COLOR': PlutoCell(value: e.color),
              'PANTONE-VALUE': PlutoCell(value: e.pantoneValue),
            }))
        .toList();

    // If you have a filtering state,
    // you need to implement it so that the user gets data from the server
    // according to the filtering state.
    //
    // request.page is 1 when the filtering state changes.
    // This is because, when the filtering state is changed,
    // the first page must be loaded with the new filtering applied.
    //
    // request.filterRows is a List<PlutoRow> type containing filtering information.
    // To convert to Map type, you can do as follows.
    //
    // FilterHelper.convertRowsToMap(request.filterRows);
    //
    // When the filter of abc is applied as Contains type to column2
    // and 123 as Contains type to column3, for example
    // It is returned as below.
    // {column2: [{Contains: 123}], column3: [{Contains: abc}]}
    //
    // If multiple filtering conditions are set in one column,
    // multiple conditions are included as shown below.
    // {column2: [{Contains: abc}, {Contains: 123}]}
    //
    // The filter type in FilterHelper.defaultFilters is the default,
    // If there is user-defined filtering,
    // the title set by the user is returned as the filtering type.
    // All filtering can change the value returned as a filtering type by changing the name property.
    // In case of PlutoFilterTypeContains filter, if you change the static type name to include
    // PlutoFilterTypeContains.name = 'include';
    // {column2: [{include: abc}, {include: 123}]} will be returned.

    // if (request.filterRows.isNotEmpty) {
    //   final filter = FilterHelper.convertRowsToFilter(
    //     request.filterRows,
    //     stateManager.refColumns,
    //   );

    //   print(FilterHelper.convertRowsToMap(request.filterRows));

    //   tempList = tempList.where(filter!).toList();
    // }

    // final page = request.page;
    // const pageSize = 100;
    // final totalPage = (tempList.length / pageSize).ceil();
    // final start = (page - 1) * pageSize;
    // final end = start + pageSize;

    // Iterable<PlutoRow> fetchedRows = tempList.getRange(
    //   max(0, start),
    //   min(tempList.length, end),
    // );

    // await Future.delayed(const Duration(milliseconds: 500));

    return Future.value(PlutoLazyPaginationResponse(
      totalPage: response.data!.totalPages!,
      rows: tempList,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlutoGrid(
        columns: columns,
        rows: rows,
        configuration: PlutoGridConfiguration(
          columnFilter: PlutoGridColumnFilterConfig(
            filters: [FilterHelper.defaultFilters[0]],
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
        onLoaded: (PlutoGridOnLoadedEvent event) {
          stateManager = event.stateManager;
          for (var element in stateManager.columns) {
            element.enableColumnDrag = false;
            element.enableContextMenu = false;
            element.enableSorting = false;
          }
        },
        onRowDoubleTap: (event) {
          accionesPublicacion(context, ref);
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
        createFooter: (stateManager) {
          return PlutoLazyPagination(
            initialPage: 1,
            initialFetch: true,

            // Decide whether sorting will be handled by the server.
            // If false, handle sorting on the client side.
            // Default is true.
            fetchWithSorting: true,

            // Decide whether filtering is handled by the server.
            // If false, handle filtering on the client side.
            // Default is true.
            fetchWithFiltering: true,

            // Determines the page size to move to the previous and next page buttons.
            // Default value is null. In this case,
            // it moves as many as the number of page buttons visible on the screen.
            pageSizeToMove: null,
            fetch: fetch,
            stateManager: stateManager,
          );
        },
      ),
    );
  }
}
*/