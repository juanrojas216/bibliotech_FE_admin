import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EditorialesAbm extends StatefulWidget {
  const EditorialesAbm({Key? key}) : super(key: key);

  @override
  State<EditorialesAbm> createState() => _EditorialesAbmState();
}

class _EditorialesAbmState extends State<EditorialesAbm> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
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
              "EDITORIALES",
              style: TextStyle(fontSize: 30),
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
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
            // initialValue: const {
            //   'movie_rating': 5,
            //   'best_language': 'Dart',
            //   'age': '13',
            //   'gender': 'Male',
            //   'languages_filter': ['Dart']
            // },
            skipDisabled: true,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Flexible(
                  child: FormBuilderTextField(
                    name: 'nueva_editorial',
                    decoration: const InputDecoration(
                        labelText: 'NUEVA EDITORIAL',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5)))),
                  ),
                ),
                SizedBox(
                  width: 20.w,
                  height: 54,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.saveAndValidate() ?? false) {
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
                            Text('Agregar editorial',
                                style: TextStyle(color: Colors.white)),
                          ])),
                ),
              ],
            )),
        const SizedBox(height: 10),
        Flexible(
          child: const TablaPublicaciones(),
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
        PlutoColumn(
            title: 'Autor',
            field: 'autor',
            type: PlutoColumnType.text(),
            readOnly: true),
        PlutoColumn(
            title: 'Editorial',
            field: 'editorial',
            type: PlutoColumnType.text(),
            readOnly: true),
        PlutoColumn(
            title: 'Edición',
            field: 'edicion',
            type: PlutoColumnType.text(),
            readOnly: true),
        PlutoColumn(
            title: 'Año',
            field: 'anio',
            type: PlutoColumnType.number(),
            readOnly: true),
      ],
      rows: [
        PlutoRow(cells: {
          'titulo': PlutoCell(value: 'Harry Potter y la piedra filosofal'),
          'autor': PlutoCell(value: 'J.K. Rowling'),
          'editorial': PlutoCell(value: 'Salamandra'),
          'edicion': PlutoCell(value: '20 Aniversario'),
          'anio': PlutoCell(value: 2020),
        }),
        PlutoRow(cells: {
          'titulo': PlutoCell(value: 'Harry Potter y la piedra filosofal'),
          'autor': PlutoCell(value: 'J.K. Rowling'),
          'editorial': PlutoCell(value: 'Salamandra'),
          'edicion': PlutoCell(value: '20 Aniversario'),
          'anio': PlutoCell(value: 2020),
        }),
        PlutoRow(cells: {
          'titulo': PlutoCell(value: 'Harry Potter y la piedra filosofal'),
          'autor': PlutoCell(value: 'J.K. Rowling'),
          'editorial': PlutoCell(value: 'Salamandra'),
          'edicion': PlutoCell(value: '20 Aniversario'),
          'anio': PlutoCell(value: 2020),
        }),
        PlutoRow(cells: {
          'titulo': PlutoCell(value: 'Harry Potter y la piedra filosofal'),
          'autor': PlutoCell(value: 'J.K. Rowling'),
          'editorial': PlutoCell(value: 'Salamandra'),
          'edicion': PlutoCell(value: '20 Aniversario'),
          'anio': PlutoCell(value: 2020),
        }),
        PlutoRow(cells: {
          'titulo': PlutoCell(value: 'Harry Potter y la piedra filosofal'),
          'autor': PlutoCell(value: 'J.K. Rowling'),
          'editorial': PlutoCell(value: 'Salamandra'),
          'edicion': PlutoCell(value: '20 Aniversario'),
          'anio': PlutoCell(value: 2020),
        }),
      ],
    );
  }
}
