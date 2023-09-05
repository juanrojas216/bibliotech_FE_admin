import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../config/router/admin_router.dart';

class TiposPublicacionAbm extends ConsumerWidget {
  TiposPublicacionAbm({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Center(
            child: Container(
      height: 100.h,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: const Border.fromBorderSide(
            BorderSide(color: Colors.grey, width: 2)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "TIPOS DE PUBLICACIÓN",
              style: TextStyle(fontSize: 30),
            ),
            IconButton(
              onPressed: () {
                ref.read(routesProvider).pop();
              },
              icon: const Icon(Icons.arrow_back),
            )
          ],
        ),
        const SizedBox(height: 10),
        FormBuilder(
            key: _formKey,
            // enabled: false,
            onChanged: () {
              _formKey.currentState!.save();
              debugPrint(_formKey.currentState!.value.toString());
            },
            autovalidateMode: AutovalidateMode.disabled,
            skipDisabled: true,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Flexible(
                  flex: 8,
                  child: FormBuilderTextField(
                    name: 'nuevo_tipo_publicacion',
                    decoration: const InputDecoration(
                        labelText: 'NUEVO TIPO DE PUBLICACIÓN',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5)))),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 300),
                    height: 54,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.saveAndValidate() ??
                              false) {
                            debugPrint(_formKey.currentState?.value.toString());
                          } else {
                            debugPrint(_formKey.currentState?.value.toString());
                            debugPrint('validation failed');
                          }
                        },
                        child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.add),
                              Text('Agregar tipo de publicación',
                                  style: TextStyle(color: Colors.white)),
                            ])),
                  ),
                ),
              ],
            )),
        const SizedBox(height: 10),
        const Flexible(
          child: TablaPublicaciones(),
        ),
      ]),
    )));
  }
}

class TablaPublicaciones extends StatefulWidget {
  const TablaPublicaciones({
    super.key,
  });

  @override
  State<TablaPublicaciones> createState() => TablaPublicacionesState();
}

class TablaPublicacionesState extends State<TablaPublicaciones> {
  late PlutoGridStateManager stateManagerProviders;

  @override
  Widget build(BuildContext context) {
    return PlutoGrid(
      configuration: const PlutoGridConfiguration(
          style: PlutoGridStyleConfig(
            gridBackgroundColor: Colors.transparent,
            gridBorderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          columnSize: PlutoGridColumnSizeConfig(
            autoSizeMode: PlutoAutoSizeMode.scale,
          )),
      mode: PlutoGridMode.readOnly,
      createFooter: (stateManager) {
        stateManager.setPageSize(40, notify: false); // default 40
        return PlutoPagination(stateManager);
      },
      columns: [
        PlutoColumn(
            title: 'Título',
            field: 'titulo',
            type: PlutoColumnType.text(),
            readOnly: true),
      ],
      rows: [
        PlutoRow(cells: {
          'titulo': PlutoCell(value: 'Harry Potter y la piedra filosofal'),
        }),
        PlutoRow(cells: {
          'titulo': PlutoCell(value: 'Harry Potter y la piedra filosofal'),
        }),
        PlutoRow(cells: {
          'titulo': PlutoCell(value: 'Harry Potter y la piedra filosofal'),
        }),
        PlutoRow(cells: {
          'titulo': PlutoCell(value: 'Harry Potter y la piedra filosofal'),
        }),
        PlutoRow(cells: {
          'titulo': PlutoCell(value: 'Harry Potter y la piedra filosofal'),
        }),
      ],
    );
  }
}
